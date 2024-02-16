import '../models/recipe_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class RecipeItemWidget extends StatelessWidget {
  RecipeItemWidget(
    this.recipeItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  RecipeItemModel recipeItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage14,
            height: 89.v,
            width: 140.h,
          ),
          SizedBox(height: 22.v),
          Text(
            recipeItemModelObj.recipeName!,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.titleMediumPrimary,
          ),
          SizedBox(height: 9.v),
        ],
      ),
    );
  }
}
