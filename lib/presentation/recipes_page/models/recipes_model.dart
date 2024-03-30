// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:mandar_purushottam_s_application1/UserModel/RecipeModel.dart';

/// This class defines the variables used in the [recipes_page],
/// and is typically used to hold data that is passed between different parts of the application.
class RecipeListModel extends Equatable {
  RecipeListModel({this.recipeItemList = const []});

  List<RecipeModel> recipeItemList;

  RecipeListModel copyWith({List<RecipeModel>? recipeItemList}) {
    return RecipeListModel(
      recipeItemList: recipeItemList ?? this.recipeItemList,
    );
  }

  @override
  List<Object?> get props => [recipeItemList];
}
