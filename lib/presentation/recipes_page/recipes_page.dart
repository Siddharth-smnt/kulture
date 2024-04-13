import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/screen/add_recipe_screen.dart';
import 'bloc/recipes_bloc.dart';
import 'models/recipes_model.dart';
import 'widgets/recipe_item_widget.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:mandar_purushottam_s_application1/widgets/app_bar/custom_app_bar.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<RecipesBloc>(
      create: (context) =>
          RecipesBloc(RecipesState(recipesModelObj: RecipeListModel()))
            ..add(RecipesInitialEvent()),
      child: RecipesPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          centerTitle: true,
          title: AppbarSubtitle(text: "lbl_recipes2".tr),
          styleType: Style.bgFill,
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              Container(
                height: 14.v,
                width: double.maxFinite,
                decoration: BoxDecoration(color: appTheme.orangeA700),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 24.h, top: 32.v, right: 24.h),
                  child: BlocBuilder<RecipesBloc, RecipesState>(
                    buildWhen: (previous, current) => previous != current,
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFFF6B00), // Set background color to #FF6B00
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddRecipeScreen()),
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white, // Set icon color to white
          ),
        ),
      ),
    );
  }

  /// Navigates to the sabudanaKhichdiScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the sabudanaKhichdiScreen.
  static onTapRecipe1(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.sabudanaKhichdiScreen,
    );
  }
}
