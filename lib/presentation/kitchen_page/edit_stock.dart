import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/UserModel/InventoryModel.dart';
import 'package:mandar_purushottam_s_application1/services/authentication/authentication.dart';

class EditItemScreen extends StatefulWidget {
  EditItemScreen(this.itemObj, this.docId, {Key? key}) : super(key: key);

  final InventoryModel itemObj;
  final String docId;

  @override
  _EditItemScreenState createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  String? _docId;
  String? _selectedCriteria;
  String? _itemName;
  int? _quantity;
  String? _selectedUnit;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final AuthServices _auth = AuthServices();

  TextEditingController _itemNameController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedCriteria = widget.itemObj.category;
    _itemName = widget.itemObj.itemName;
    _quantity = widget.itemObj.quantity;
    _selectedUnit = widget.itemObj.unit;
    _docId = widget.docId;

    _itemNameController.text = widget.itemObj.itemName;
    _quantityController.text = widget.itemObj.quantity.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6C03),
        title: Center(
          child: Text(
            'EDIT ITEM',
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
                DropdownMenuItem<String>(
                  child: Text('Dairy'),
                  value: 'Dairy',
                ),
              ],
              onChanged: (String? value) {
                setState(() {
                  _selectedCriteria = value;
                });
              },
              hint: Text('Select Criteria'),
              dropdownColor: Colors.white,
            ),
            SizedBox(height: 16.0),
            Text(
              'Item Name',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _itemNameController,
              style: TextStyle(color: Colors.black),
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
                    controller: _quantityController,
                    style: TextStyle(color: Colors.black),
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
                        _selectedUnit = value;
                      });
                    },
                    hint: Text('Unit'),
                    dropdownColor: Colors.white,
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
                    primary: Color(0xFFFF6B00),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 12.0, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _firebaseFirestore
                        .collection("User")
                        .doc(_auth.user?.uid)
                        .collection("Inventory")
                        .doc(_docId)
                        .delete();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF6B00),
                  ),
                  child: Text(
                    'Delete',
                    style: TextStyle(fontSize: 12.0, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_selectedCriteria != null &&
                        _itemName != null &&
                        _quantity != null &&
                        _selectedUnit != null) {
                      InventoryModel data = InventoryModel(
                        category: _selectedCriteria!,
                        itemName: _itemName!.trim(),
                        quantity: _quantity!,
                        unit: _selectedUnit!,
                      );
                      await _firebaseFirestore
                          .collection("User")
                          .doc(_auth.user?.uid)
                          .collection("Inventory")
                          .doc(_docId)
                          .set(data.toJson());
                      Navigator.pop(context);
                    } else {
                      print("Please fill all fields");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF6B00),
                  ),
                  child: Text(
                    'Update',
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
