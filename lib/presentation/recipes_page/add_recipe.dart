import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/UserMode/UserModel.dart';

class AddRecipeScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddRecipeScreen> {
  String? _recipeName;
  String? _recipeDescription;
  Map<String, int>? _recipeItems;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Widget> inputRows = [];

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
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Quantity',
                            ),
                          ),
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
                      UserItem userModel = UserItem(
                        category: _selectedCriteria!,
                        itemName: _itemName!,
                        quantity: _quantity!,
                        userId: '1234',
                      );
                      await _firebaseFirestore
                          .collection("UserItems")
                          .doc()
                          .set(userModel.toJson());
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
