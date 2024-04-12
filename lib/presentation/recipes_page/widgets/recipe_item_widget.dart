import 'package:mandar_purushottam_s_application1/UserModel/RecipeModel.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/screen/recipe_screen.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';

class RecipeItemWidget extends StatelessWidget {
  RecipeItemWidget(this.recipeItemModelObj, {Key? key}) : super(key: key);

  final RecipeModel recipeItemModelObj;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeScreen(recipeItemModelObj),
          ),
        );
      },
      child: Container(
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
              url: (recipeItemModelObj.imageUrl != null &&
                      recipeItemModelObj.imageUrl!.isNotEmpty)
                  ? recipeItemModelObj.imageUrl
                  : null,
              imagePath: (recipeItemModelObj.imageUrl != null &&
                      recipeItemModelObj.imageUrl!.isNotEmpty)
                  ? null
                  : ImageConstant.imgImage14,
              height: 89.v,
              width: 140.h,
            ),
            SizedBox(height: 22.v),
            Text(
              recipeItemModelObj.recipeName,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.titleMediumPrimary,
            ),
            // SizedBox(height: 9.v),
          ],
        ),
      ),
    );
  }
}
