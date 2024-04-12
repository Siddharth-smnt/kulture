import "dart:io";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_storage/firebase_storage.dart";
import "package:mandar_purushottam_s_application1/UserModel/RecipeModel.dart";
import "package:mandar_purushottam_s_application1/UserModel/UserModel.dart";
import "package:mandar_purushottam_s_application1/core/utils/image_constant.dart";
import "package:mandar_purushottam_s_application1/presentation/recipes_page/models/default_recipes.dart";

class AuthServices {
  AuthServices();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get user => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // sign in anon
  Future<User?> signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // signup with email
  Future signUp(String email, String password, String name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password).then((userDoc) async {
        await userDoc.user?.updateDisplayName(name);
        return userDoc;
        });
      User? user = result.user;
      // create a new document for the user with the uid
      await createUserDoc(user, name);
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }

  // login with email
  Future login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return error.toString();
    } 
  }

  // Logout
  Future logout() async {
    try {
      await _auth.signOut();
    } catch (error) {
      print("Logout Error: ${error.toString()}");
    }
  }

  Future createUserDoc(User? user, String name) async {
    if(user != null) {
      UserModel myUser = UserModel(uid: user.uid, name: name);
      await _firestore.collection("User").doc(user.uid).set(myUser.toJson());

      // Add default recipes
      defaultRecipes.forEach((recipe) async {
        final _imageUrl = await getDefaultImageUrl(recipe);
        RecipeModel _recipe = RecipeModel(
            recipeName: recipe.recipeName,
            recipeDescription: recipe.recipeDescription,
            ingredients: recipe.ingredients,
            imageUrl: _imageUrl);
        await _firestore
            .collection("User")
            .doc(user.uid)
            .collection("Recipes")
            .add(_recipe.toJson())
            .then((DocumentReference doc) async {
          await doc.update({'id': doc.id});
        });
      });
    } else {
      print("User Doc not created because not authenticated");
    }
  }

  Future<String> getDefaultImageUrl(RecipeModel recipe) async {
    final _filePath;
    switch (recipe.recipeName) {
      case "Sabudana Khichdi":
        _filePath = ImageConstant.imgImage12;
        break;
      case "Chole Bhature":
        _filePath = ImageConstant.imgImage13;
        break;
      case "Veg Biryani":
        _filePath = ImageConstant.imgImage14;
        break;
      case "Veg Pulav":
        _filePath = ImageConstant.imgImage15;
        break;
      default:
        _filePath = ImageConstant.imgImage12;
    }
    try {
      final uploadPath =
          "/users/${_auth.currentUser?.uid}/recipes/${recipe.recipeName}";
      final ref = FirebaseStorage.instance.ref().child(uploadPath);
      await ref.putFile(File(_filePath));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      print("inside uploadImage");
      print(e.toString());
      return "error";
    }
  }
}