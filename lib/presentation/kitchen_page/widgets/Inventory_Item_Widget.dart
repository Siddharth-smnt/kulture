import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/UserModel/InventoryModel.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/presentation/kitchen_page/edit_stock.dart';
import 'package:mandar_purushottam_s_application1/services/authentication/authentication.dart';

class InventoryItemWidget extends StatelessWidget {
  final InventoryModel inventoryItemModelObj;
  final String docId;
  final AuthServices _auth = AuthServices();

  InventoryItemWidget(
    this.inventoryItemModelObj, {
    Key? key,
    required this.docId,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditItemScreen(inventoryItemModelObj, docId),
          ),
        );
      },
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.h,
            vertical: 5.v,
          ),
          decoration: AppDecoration.outlineOnPrimaryContainer,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // SizedBox(height: 9.v),
              CustomImageView(
                imagePath: _getImagePath(inventoryItemModelObj),
                height: 70.v,
                width: 100.h,
              ),
              // SizedBox(height: 16.v),
              Text(
                inventoryItemModelObj.itemName,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium,
              ),
              // SizedBox(height: 9.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgMaterialsymbolsdelete,
                    height: 26.adaptSize,
                    width: 26.adaptSize,
                    onTap: () {
                      decreaseItemCount(docId);
                    },
                  ),
                  Text(
                    "${inventoryItemModelObj.quantity} ${inventoryItemModelObj.unit}",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgGridiconsaddoutline,
                    height: 26.adaptSize,
                    width: 26.adaptSize,
                    onTap: () {
                      increaseItemCount(docId);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _getImagePath(InventoryModel obj) {
    switch (obj.category) {
      case "Condiments":
        return ImageConstant.imgImage2;
      case "Vegetables":
        return ImageConstant.imgImage8;
      case "Dairy":
        return ImageConstant.imgImage17;
      default:
        return null;
    }
  }

  void decreaseItemCount(String docId) {
    int newQuantity = inventoryItemModelObj.quantity - 1;
    if (newQuantity >= 0) {
      if (newQuantity == 0) {
        // Delete the document if quantity becomes zero
        FirebaseFirestore.instance
            .collection("User")
            .doc(_auth.user?.uid)
            .collection('Inventory')
            .doc(docId)
            .delete();
      } else {
        // Update the quantity otherwise
        FirebaseFirestore.instance
            .collection("User")
            .doc(_auth.user?.uid)
            .collection('Inventory')
            .doc(docId)
            .update({'quantity': newQuantity});
      }
    }
  }

  void increaseItemCount(String docId) {
    FirebaseFirestore.instance
        .collection("User")
        .doc(_auth.user?.uid)
        .collection('Inventory')
        .doc(docId)
        .update({'quantity': FieldValue.increment(1)});
  }
}
