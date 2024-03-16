import 'package:mandar_purushottam_s_application1/add_stock.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/add_recipe.dart';
import 'package:mandar_purushottam_s_application1/widgets/custom_floating_button.dart';

import '../recipes_page/widgets/recipe_item_widget.dart';
import 'bloc/recipes_bloc.dart';
import 'models/recipe_item_model.dart';
import 'models/recipes_model.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/custom_app_bar.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<RecipesBloc>(
        create: (context) =>
            RecipesBloc(RecipesState(recipesModelObj: RecipesModel()))
              ..add(RecipesInitialEvent()),
        child: RecipesPage());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            centerTitle: true,
            title: AppbarSubtitle(text: "lbl_recipes2".tr),
            styleType: Style.bgFill),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              Container(
                  height: 14.v,
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: appTheme.orangeA700)),
              Padding(
                  padding: EdgeInsets.only(left: 24.h, top: 35.v, right: 24.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              onTapRecipe1(context);
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.h, vertical: 16.v),
                                decoration: AppDecoration.outlinePrimary
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder20),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                          height: 87.v,
                                          width: 140.h,
                                          child: Stack(
                                              alignment: Alignment.bottomCenter,
                                              children: [
                                                CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgImage12,
                                                    height: 87.v,
                                                    width: 140.h,
                                                    alignment:
                                                        Alignment.center),
                                                CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgImage12,
                                                    height: 6.v,
                                                    width: 10.h,
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    margin: EdgeInsets.only(
                                                        bottom: 36.v))
                                              ])),
                                      SizedBox(height: 23.v),
                                      Text("msg_sabudana_khichdi".tr,
                                          style: CustomTextStyles
                                              .titleMediumPrimary),
                                      SizedBox(height: 10.v)
                                    ]))),
                        Container(
                            margin: EdgeInsets.only(left: 15.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.h, vertical: 16.v),
                            decoration: AppDecoration.outlinePrimary.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder20),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgImage13,
                                      height: 87.v,
                                      width: 140.h),
                                  SizedBox(height: 23.v),
                                  Text("lbl_puri_chole".tr,
                                      style:
                                          CustomTextStyles.titleMediumPrimary),
                                  SizedBox(height: 10.v)
                                ]))
                      ])),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 24.h, top: 32.v, right: 24.h),
                  child: BlocBuilder<RecipesBloc, RecipesState>(
                    builder: (context, state) {
                      final recipesModelObj = state.recipesModelObj;
                      if (recipesModelObj == null ||
                          recipesModelObj.recipeItemList.isEmpty) {
                        return Center(
                          child: Text('No recipes available'),
                        );
                      }
                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 180.v,
                          crossAxisCount: 2,
                          mainAxisSpacing: 15.h,
                          crossAxisSpacing: 15.h,
                        ),
                        physics: BouncingScrollPhysics(),
                        itemCount: recipesModelObj.recipeItemList.length,
                        itemBuilder: (context, index) {
                          final model = recipesModelObj.recipeItemList[index];
                          return RecipeItemWidget(model);
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: CustomFloatingButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddRecipeScreen()),
            );
          },
          iconPath: ImageConstant.imgPlus,
        ),
      ),
    );
  }

  /// Navigates to the sabudanaKhichdiScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the sabudanaKhichdiScreen.
  onTapRecipe1(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.sabudanaKhichdiScreen,
    );
  }
}
