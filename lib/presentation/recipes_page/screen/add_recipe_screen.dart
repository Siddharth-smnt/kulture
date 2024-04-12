import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mandar_purushottam_s_application1/UserModel/RecipeModel.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/bloc/recipes_bloc.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/models/recipes_model.dart';
import 'package:mandar_purushottam_s_application1/routes/app_routes.dart';
import 'package:mandar_purushottam_s_application1/services/authentication/authentication.dart';
import 'package:mandar_purushottam_s_application1/services/storage.dart';

class AddRecipeScreen extends StatefulWidget {
  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  String? _recipeName;
  String? _recipeDescription;
  List<IngredientModel> _recipeItems = [];
  String? _imageUrl;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final AuthServices _auth = AuthServices();
  RecipesBloc recipesBloc =
      RecipesBloc(RecipesState(recipesModelObj: RecipeListModel()));
  ImagePicker picker = ImagePicker();
  XFile? _file;
  StorageServices storage = StorageServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6C03),
        title: Text(
          'ADD RECIPE',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Upload Recipe Image",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  if (_file != null)
                    Container(
                      margin: EdgeInsets.all(5),
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(File(_file!.path), fit: BoxFit.cover),
                      ),
                    ),
                  Text(_file != null ? _file!.name : "",
                      style: TextStyle(color: Colors.black87)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          _file = await picker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {});
                        },
                        child: Text(
                          "Gallery",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey.shade400),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () async {
                          _file = await picker.pickImage(
                              source: ImageSource.camera);
                          setState(() {});
                        },
                        child: Text(
                          "Camera",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey.shade400),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TextFormField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Recipe Name',
                hintText: 'Enter Recipe Name',
              ),
              onChanged: (value) {
                setState(() {
                  _recipeName = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Recipe Description',
                hintText: 'Enter Recipe Description',
              ),
              onChanged: (value) {
                setState(() {
                  _recipeDescription = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Recipe Ingredients',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.grey[300]!),
              ),
              onPressed: _addIngredient,
              icon: Icon(Icons.add),
              label: Text(
                'Add Ingredient',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 12.0),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _recipeItems.length,
              itemBuilder: (context, index) {
                return _buildIngredientRow(index);
              },
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF6B00),
                    textStyle: TextStyle(
                        color: Colors.black), // Change text color here
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: _submitRecipe,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF6B00),
                    textStyle: TextStyle(
                        color: Colors.black), // Change text color here
                  ),
                  child: Text(
                    'Add Recipe',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIngredientRow(int index) {
    return Container(
      color: Colors.grey[200],
      margin: EdgeInsetsDirectional.symmetric(vertical: 5),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Ingredient Name',
                    hintText: 'Enter Ingredient Name',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _recipeItems[index].name = value.trim();
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 8.0),
              Expanded(
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                    hintText: 'Enter Quantity',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _recipeItems[index].quantity = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              Expanded(
                child: DropdownButton<String>(
                  value: _recipeItems[index].unit,
                  items: [
                    DropdownMenuItem<String>(
                      child: Text('unit'),
                      value: 'unit',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('g'),
                      value: 'g',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('kg'),
                      value: 'kg',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('ml'),
                      value: 'ml',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('ltr'),
                      value: 'ltr',
                    ),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      _recipeItems[index].unit = value ?? 'unit';
                    });
                  },
                  hint: Text('Unit'),
                  dropdownColor: Colors.white,
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    _recipeItems.removeAt(index);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _addIngredient() {
    setState(() {
      _recipeItems.add(IngredientModel(name: "", quantity: 0, unit: "unit"));
    });
  }

  Future<void> getImageUrl() async {
    if (_file != null) {
      _imageUrl = await storage.uploadImage(
          "/users/${_auth.user?.uid}/recipes", _file!,
          fileName: _recipeName);
    }
  }

  void _submitRecipe() async {
    if (_recipeName != null &&
        _recipeDescription != null &&
        _recipeItems.isNotEmpty) {
      await getImageUrl();
      RecipeModel recipeModel = RecipeModel(
        recipeName: _recipeName!.trim(),
        recipeDescription: _recipeDescription!,
        ingredients: _recipeItems,
        imageUrl: _imageUrl,
      );
      await _firebaseFirestore
          .collection("User")
          .doc(_auth.user?.uid)
          .collection("Recipes")
          .add(recipeModel.toJson())
          .then((DocumentReference doc) async {
        await doc.update({'id': doc.id});
      });

      recipesBloc..add(RefreshRecipesEvent());
      Navigator.pushReplacementNamed(context, AppRoutes.recipesPage);
    } else {
      print("Please fill all fields");
    }
  }
}
