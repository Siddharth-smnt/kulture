import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mandar_purushottam_s_application1/UserModel/RecipeModel.dart';

class AddRecipeScreen extends StatefulWidget {
  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class Entry {
  String name;
  int quantity;
  Entry(this.name, this.quantity);
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  String? _recipeName;
  String? _recipeDescription;
  List<Entry> _recipeItems = []; // Initialize the list properly
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

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
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextFormField(
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
        SizedBox(width: 12.0),
        Expanded(
          child: TextFormField(
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
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            setState(() {
              _recipeItems.removeAt(index);
            });
          },
        ),
      ],
    );
  }

  void _addIngredient() {
    setState(() {
      _recipeItems.add(Entry('', 0)); // Add a new Entry
    });
  }

  void _submitRecipe() async {
    if (_recipeName != null &&
        _recipeDescription != null &&
        _recipeItems.isNotEmpty) {
      RecipeModel recipeModel = RecipeModel(
        recipeName: _recipeName!,
        recipeDescription: _recipeDescription!,
        ingredients: _recipeItems
            .map((entry) => IngredientModel(
                name: entry.name, quantity: entry.quantity, unit: ''))
            .toList(),
      );
      await _firebaseFirestore
          .collection("RecipeItems")
          .add(recipeModel.toJson());
      Navigator.pop(context);
    } else {
      // Show an error message or handle validation
      print("Please fill all fields");
    }
  }
}
