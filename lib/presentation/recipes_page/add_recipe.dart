import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/UserMode/RecipeModel.dart';
import 'package:mandar_purushottam_s_application1/UserMode/UserModel.dart';

class AddRecipeScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class Entry {
  String name;
  int quantity;
  Entry(this.name, this.quantity);
  void setName(String name) {
    this.name = name;
  }

  void setQuantity(int q) {
    this.quantity = q;
  }
}

class _AddItemScreenState extends State<AddRecipeScreen> {
  String? _recipeName;
  String? _recipeDescription;
  List<Entry>? _recipeItems;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Widget> inputRows = [];
  Entry? temp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6C03),
        title: Center(
          child: Text(
            'ADD RECIPE',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Recipe Name',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter Recipe Name',
              ),
              onChanged: (value) {
                setState(() {
                  _recipeName = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Recipe Description',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
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
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  inputRows.add(
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Name',
                            ),
                            onChanged: (value) {
                              setState(() {
                                temp?.setName(value);
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Quantity',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  temp?.setQuantity(value as int);
                                });
                                _recipeItems?.add(temp!);
                              }),
                        ),
                      ],
                    ),
                  );
                });
              },
            ),
            SizedBox(height: 80.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFCC5602),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 12.0, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_recipeName != null &&
                        _recipeDescription != null &&
                        _recipeItems != null) {
                      RecipeItems recipeModel = RecipeItems(
                        name: _recipeName!,
                        description: _recipeDescription!,
                        items: _recipeItems!,
                        userId: '1234',
                      );
                      await _firebaseFirestore
                          .collection("RecipeItems")
                          .doc()
                          .set(recipeModel.toJson());
                      Navigator.pop(context);
                    } else {
                      // Show an error message or handle validation
                      print("Please fill all fields");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFCC5602),
                  ),
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 12.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
