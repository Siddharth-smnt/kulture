import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mandar_purushottam_s_application1/UserModel/InventoryModel.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';

class InventoryItemWidget extends StatelessWidget {
  final InventoryModel inventoryItemModelObj;
  final String docId; // Define docId as a member variable

  InventoryItemWidget(
    this.inventoryItemModelObj, {
    Key? key,
    required this.docId, // Receive docId as a required parameter
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
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
            SizedBox(height: 9.v),
            CustomImageView(
              imagePath: ImageConstant.imgImage2,
              height: 55.v,
              width: 100.h,
            ),
            SizedBox(height: 16.v),
            Text(
              inventoryItemModelObj.itemName,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 9.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomImageView(
                  svgPath: ImageConstant.imgMaterialsymbolsdelete,
                  height: 26.adaptSize,
                  width: 26.adaptSize,
                  onTap: () {
                    decreaseItemCount(docId); // Pass docId to the method
                  },
                ),
                Text(
                  "Count : ${inventoryItemModelObj.quantity}",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                CustomImageView(
                  svgPath: ImageConstant.imgGridiconsaddoutline,
                  height: 26.adaptSize,
                  width: 26.adaptSize,
                  onTap: () {
                    increaseItemCount(docId); // Pass docId to the method
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void decreaseItemCount(String docId) {
    int newQuantity = inventoryItemModelObj.quantity - 1;
    if (newQuantity >= 0) {
      if (newQuantity == 0) {
        // Delete the document if quantity becomes zero
        FirebaseFirestore.instance.collection('Inventory').doc(docId).delete();
      } else {
        // Update the quantity otherwise
        FirebaseFirestore.instance
            .collection('Inventory')
            .doc(docId)
            .update({'quantity': newQuantity});
      }
    }
  }

  void increaseItemCount(String docId) {
    FirebaseFirestore.instance
        .collection('Inventory')
        .doc(docId) // Use the received document ID
        .update({'quantity': FieldValue.increment(1)});
  }
}
