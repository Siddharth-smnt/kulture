import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/UserModel/RecipeModel.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/screen/edit_recipe_screen.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/appbar_image_2.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/custom_app_bar.dart';

class RecipeScreen extends StatelessWidget {
  RecipeScreen(this.recipe, {Key? key}) : super(key: key);

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(
                height: 296.v,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomAppBar(
                      height: 89.v,
                      leadingWidth: double.maxFinite,
                      leading: AppbarImage2(
                        svgPath: ImageConstant.imgArrowleft,
                        margin: EdgeInsets.fromLTRB(24.h, 32.v, 341.h, 16.v),
                        onTap: () {
                          Navigator.pop(context); // Navigate back
                        },
                      ),
                      actions: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditRecipeScreen(recipeObj: recipe),
                              ),
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 226.v,
                        width: 312.h,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 226.v,
                                width: 312.h,
                                decoration: BoxDecoration(
                                  color: appTheme.orange50,
                                  borderRadius: BorderRadius.circular(156.h),
                                ),
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgImage12,
                              height: 155.v,
                              width: 250.h,
                              alignment: Alignment.bottomCenter,
                              margin: EdgeInsets.only(bottom: 27.v),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 14.v,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: appTheme.whiteA700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 24.h, right: 26.h, bottom: 5.v),
                    child: Column(
                      children: [
                        Text(
                          recipe.recipeName,
                          style: CustomTextStyles.headlineSmallOnPrimary,
                        ),
                        SizedBox(height: 18.v),
                        SizedBox(
                          width: 342.h,
                          child: Text(
                            recipe.recipeDescription ?? "No description",
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.bodyMediumFigtreePrimary
                                .copyWith(height: 1.50),
                          ),
                        ),
                        SizedBox(height: 18.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "lbl_ingredients".tr,
                            style: CustomTextStyles.titleMediumOrange900,
                          ),
                        ),
                        SizedBox(height: 18.v),
                        // Make the list of ingredients scrollable
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: recipe.ingredients?.length ??
                                    0, // Check for null
                                itemBuilder: (context, index) {
                                  final ingredient = recipe.ingredients![index];
                                  return ListTile(
                                    title: Text(
                                      ingredient.name,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    subtitle: Text(
                                      ingredient.quantity.toString(),
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
