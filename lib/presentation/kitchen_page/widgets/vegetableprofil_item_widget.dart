import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/vegetableprofil_item_model.dart';

class VegetableprofilItemWidget extends StatelessWidget {
  final String docId; // Added document ID field
  final VegetableprofilItemModel vegetableprofilItemModelObj;

  VegetableprofilItemWidget(
      this.vegetableprofilItemModelObj, {
        required this.docId, // Required document ID parameter
        Key? key,
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
              imagePath: ImageConstant.imgImage7,
              height: 62.v,
              width: 80.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 9.v,
                  right: 31.h,
                ),
                child: Text(
                  vegetableprofilItemModelObj.itemName,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ),
            SizedBox(height: 10.v),
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
                  "Count : ${vegetableprofilItemModelObj.quantity}",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                CustomImageView(
                  svgPath: ImageConstant.imgGridiconsaddoutline,
                  height: 26.adaptSize,
                  width: 26.adaptSize,
                  onTap: () {
                    increaseItemCount();
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
    int newQuantity = vegetableprofilItemModelObj.quantity - 1;
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


  void increaseItemCount() {
    FirebaseFirestore.instance
        .collection('UserItems')
        .doc(docId) // Use the received document ID
        .update({'quantity': FieldValue.increment(1)});
  }
}
