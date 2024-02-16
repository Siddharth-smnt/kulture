import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/condiment_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';

class CondimentItemWidget extends StatelessWidget {
  final CondimentItemModel condimentItemModelObj;
  final String docId; // Define docId as a member variable

  CondimentItemWidget(
      this.condimentItemModelObj, {
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
              condimentItemModelObj.itemName!,
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
                  "Count : ${condimentItemModelObj.quantity}",
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
    int newQuantity = condimentItemModelObj.quantity - 1;
    if (newQuantity >= 0) {
      if (newQuantity == 0) {
        // Delete the document if quantity becomes zero
        FirebaseFirestore.instance.collection('UserItems').doc(docId).delete();
      } else {
        // Update the quantity otherwise
        FirebaseFirestore.instance.collection('UserItems').doc(docId).update({'quantity': newQuantity});
      }
    }
  }


  void increaseItemCount(String docId) {
    FirebaseFirestore.instance
        .collection('UserItems')
        .doc(docId) // Use the received document ID
        .update({'quantity': FieldValue.increment(1)});
  }
}
