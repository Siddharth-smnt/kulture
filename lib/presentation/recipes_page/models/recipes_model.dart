// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'recipe_item_model.dart';

/// This class defines the variables used in the [recipes_page],
/// and is typically used to hold data that is passed between different parts of the application.
class RecipesModel extends Equatable {
  RecipesModel({this.recipeItemList = const []}) {}

  List<RecipeItemModel> recipeItemList;

  RecipesModel copyWith({List<RecipeItemModel>? recipeItemList}) {
    return RecipesModel(
      recipeItemList: recipeItemList ?? this.recipeItemList,
    );
  }

  @override
  List<Object?> get props => [recipeItemList];
}
