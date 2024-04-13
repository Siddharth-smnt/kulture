import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mandar_purushottam_s_application1/UserModel/RecipeModel.dart';
import 'package:mandar_purushottam_s_application1/routes/app_routes.dart';
import 'package:mandar_purushottam_s_application1/services/authentication/authentication.dart';
import 'package:mandar_purushottam_s_application1/services/storage.dart';

class EditRecipeScreen extends StatefulWidget {
  EditRecipeScreen({required this.recipeObj});
  final RecipeModel recipeObj;
  @override
  _EditRecipeScreenState createState() => _EditRecipeScreenState();
}

class _EditRecipeScreenState extends State<EditRecipeScreen> {
  String? _id;
  String? _recipeName;
  String? _recipeDescription;
  String? _imageUrl;
  List<IngredientModel> _recipeItems = [];

  // Services
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final AuthServices _auth = AuthServices();
  ImagePicker picker = ImagePicker();
  StorageServices storage = StorageServices();
  XFile? _file;
  bool showCurrentImage = false;

  // Controllers
  TextEditingController _recipeNameController = TextEditingController();
  TextEditingController _recipeDescriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _recipeName = widget.recipeObj.recipeName;
    _recipeDescription = widget.recipeObj.recipeDescription;
    _recipeItems = widget.recipeObj.ingredients;
    _imageUrl = widget.recipeObj.imageUrl;
    _id = widget.recipeObj.id;

    _recipeNameController.text = widget.recipeObj.recipeName;
    _recipeDescriptionController.text = widget.recipeObj.recipeDescription;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6C03),
        title: Text(
          'EDIT RECIPE',
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
                  if (_file != null && showCurrentImage)
                    Container(
                      margin: EdgeInsets.all(5),
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(File(_file!.path), fit: BoxFit.cover),
                      ),
                    ),
                  if (_imageUrl != null && showCurrentImage == false)
                    Container(
                      margin: EdgeInsets.all(5),
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(_imageUrl!, fit: BoxFit.cover),
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
                          showCurrentImage = true;
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
                          showCurrentImage = true;
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
              controller: _recipeNameController,
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
              controller: _recipeDescriptionController,
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
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: _deleteRecipe,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF6B00),
                  ),
                  child: Text(
                    'Delete Recipe',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: _submitRecipe,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF6B00),
                  ),
                  child: Text(
                    'Edit Recipe',
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
                  initialValue: _recipeItems[index].name,
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
                  initialValue: _recipeItems[index].quantity.toString(),
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
    if (_file != null && _imageUrl != null) {
      _imageUrl = await storage.updateImage(_imageUrl!, _file!);
    }
    if (_file != null && _imageUrl == null) {
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
        id: _id,
        recipeName: _recipeName!.trim(),
        recipeDescription: _recipeDescription!,
        ingredients: _recipeItems,
        imageUrl: _imageUrl,
      );
      await _firebaseFirestore
          .collection("User")
          .doc(_auth.user?.uid)
          .collection("Recipes")
          .doc(_id)
          .set(recipeModel.toJson());
      Navigator.pushReplacementNamed(context, AppRoutes.recipesPage);
    } else {
      print("Please fill all fields");
    }
  }

  void _deleteRecipe() async {
    await _firebaseFirestore
        .collection("User")
        .doc(_auth.user?.uid)
        .collection("Recipes")
        .doc(widget.recipeObj.id)
        .delete();
    Navigator.pushReplacementNamed(context, AppRoutes.recipesPage);
  }
}
