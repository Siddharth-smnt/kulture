// ignore_for_file: must_be_immutable

part of 'recipes_bloc.dart';

/// Represents the state of Recipes in the application.
class RecipesState extends Equatable {
  RecipesState({this.recipesModelObj});

  RecipeListModel? recipesModelObj;

  RecipesState copyWith({RecipeListModel? recipesModelObj}) {
    return RecipesState(
      recipesModelObj: recipesModelObj ?? this.recipesModelObj,
    );
  }

  @override
  List<Object?> get props => [recipesModelObj];
}
