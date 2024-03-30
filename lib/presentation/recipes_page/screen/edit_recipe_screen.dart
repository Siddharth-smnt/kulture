import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mandar_purushottam_s_application1/UserModel/RecipeModel.dart';

class EditRecipeScreen extends StatefulWidget {
  EditRecipeScreen({required this.recipeObj});
  final RecipeModel recipeObj;
  @override
  _EditRecipeScreenState createState() => _EditRecipeScreenState();
}

class _EditRecipeScreenState extends State<EditRecipeScreen> {
  String? _recipeName;
  String? _recipeDescription;
  List<IngredientModel> _recipeItems = [];
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _recipeName = widget.recipeObj.recipeName;
    _recipeDescription = widget.recipeObj.recipeDescription;
    _recipeItems = widget.recipeObj.ingredients ?? [];
  }

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
              label: Text('Add Ingredient'),
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
                    primary: Colors.grey,
                  ),
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: _submitRecipe,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFCC5602),
                  ),
                  child: Text('Add Recipe'),
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
                      _recipeItems[index].name = value;
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
                      child: Text('Select Unit'),
                      value: '',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('kg'),
                      value: 'kg',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('grams'),
                      value: 'grams',
                    ),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      _recipeItems[index].unit = value ?? '';
                    });
                  },
                  hint: Text('Select Unit'),
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
      _recipeItems.add(IngredientModel(name: "", quantity: 0, unit: ""));
    });
  }

  void _submitRecipe() async {
    if (_recipeName != null &&
        _recipeDescription != null &&
        _recipeItems.isNotEmpty) {
      RecipeModel recipeModel = RecipeModel(
        recipeName: _recipeName!,
        recipeDescription: _recipeDescription!,
        ingredients: _recipeItems,
      );
      await _firebaseFirestore
          .collection("Recipes")
          .doc()
          .set(recipeModel.toJson());
      Navigator.pop(context);
    } else {
      print("Please fill all fields");
    }
  }
}