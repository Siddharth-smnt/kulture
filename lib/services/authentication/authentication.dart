import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:mandar_purushottam_s_application1/UserModel/UserModel.dart";

class AuthServices {

  AuthServices();
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
      await FirebaseFirestore.instance.collection("User").doc(user.uid).set(myUser.toJson());
    } else {
      print("User Doc not created because not authenticated");
    }
  }
}