import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/UserMode/UserModel.dart';

class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  String? _selectedCriteria;
  String? _itemName;
  int? _quantity;
  String? _selectedUnit;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6C03),
        title: Center(
          child: Text(
            'ADD ITEM',
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
              'Criteria',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _selectedCriteria,
              items: [
                DropdownMenuItem<String>(
                  child: Text('Condiments'),
                  value: 'Condiments',
                ),
                DropdownMenuItem<String>(
                  child: Text('Vegetables'),
                  value: 'Vegetables',
                ),
              ],
              onChanged: (String? value) {
                setState(() {
                  _selectedCriteria = value;
                });
              },
              hint: Text('Select Criteria'),
              dropdownColor: Colors.white, // Setting dropdown menu color to white
            ),
            SizedBox(height: 16.0),
            Text(
              'Item Name',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter Item Name',
              ),
              onChanged: (value) {
                setState(() {
                  _itemName = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Quantity',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter Quantity',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _quantity = int.tryParse(value);
                      });
                    },
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: DropdownButton<String>(
                    value: _selectedUnit,
                    items: [
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
                        _selectedUnit = value;
                      });
                    },
                    hint: Text('Select Unit'),
                    dropdownColor: Colors.white, // Setting dropdown menu color to white
                  ),
                ),
              ],
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
                    if (_selectedCriteria != null &&
                        _itemName != null &&
                        _quantity != null &&
                        _selectedUnit != null) {
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
