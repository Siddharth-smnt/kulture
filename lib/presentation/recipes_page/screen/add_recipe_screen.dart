import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mandar_purushottam_s_application1/UserModel/RecipeModel.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/bloc/recipes_bloc.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/models/recipes_model.dart';
import 'package:mandar_purushottam_s_application1/services/authentication/authentication.dart';

class AddRecipeScreen extends StatefulWidget {
  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  String? _recipeName;
  String? _recipeDescription;
  List<IngredientModel> _recipeItems = [];
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final AuthServices _auth = AuthServices();
  RecipesBloc recipesBloc =
      RecipesBloc(RecipesState(recipesModelObj: RecipeListModel()));

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

  void _submitRecipe() async {
    if (_recipeName != null &&
        _recipeDescription != null &&
        _recipeItems.isNotEmpty) {
      RecipeModel recipeModel = RecipeModel(
        recipeName: _recipeName!.trim(),
        recipeDescription: _recipeDescription!,
        ingredients: _recipeItems,
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
      Navigator.pop(context);
    } else {
      print("Please fill all fields");
    }
  }
}
