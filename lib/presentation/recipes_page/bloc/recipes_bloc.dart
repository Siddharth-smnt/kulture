import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/models/recipes_model.dart';
import '/core/app_export.dart';
import '../models/recipe_item_model.dart';
part 'recipes_event.dart';
part 'recipes_state.dart';

/// A bloc that manages the state of a Recipes according to the event that is dispatched to it.
class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  RecipesBloc(RecipesState initialState) : super(initialState) {
    on<RecipesInitialEvent>(_onInitialize);
  }

  void _onInitialize(
    RecipesInitialEvent event,
    Emitter<RecipesState> emit,
  ) async {
    emit(state.copyWith(
        recipesModelObj: state.recipesModelObj
            ?.copyWith(recipeItemList: fillRecipeItemList())));
  }

// creates 4 default recipes
  List<RecipeItemModel> defaultRecipes = [
    RecipeItemModel(
      recipeName: "Poha",
      description: "Poha recipe description",
      ingredients: [
        IngredientsListModel(ingredientName: "Poha", quantity: "1 cup"),
        IngredientsListModel(ingredientName: "Water", quantity: "2 cup"),
        IngredientsListModel(ingredientName: "Kanda", quantity: "2 cup"),
        IngredientsListModel(ingredientName: "Batata", quantity: "2 cup"),
        IngredientsListModel(ingredientName: "oil", quantity: "1 teaspoon"),
        IngredientsListModel(ingredientName: "Mirchi", quantity: "2 cup"),
      ],
    ),
    RecipeItemModel(
      recipeName: "Sabudana Khichdi",
      description: "Sabudana Khichdi recipe description",
      ingredients: [
        IngredientsListModel(ingredientName: "Sabudana", quantity: "1 cup"),
        IngredientsListModel(ingredientName: "Water", quantity: "2 cup")
      ],
    ),
    RecipeItemModel(
      recipeName: "Dal Khichdi",
      description: "Dal Khichdi recipe description",
      ingredients: [
        IngredientsListModel(ingredientName: "Dal", quantity: "1 cup"),
        IngredientsListModel(ingredientName: "Rice", quantity: "4 cup")
      ],
    ),
    RecipeItemModel(
      recipeName: "Dal Tadka",
      description: "Dal Tadka recipe description",
      ingredients: [
        IngredientsListModel(ingredientName: "Dal", quantity: "1 cup"),
        IngredientsListModel(ingredientName: "Water", quantity: "2 cup")
      ],
    ),
  ];

  List<RecipeItemModel> fillRecipeItemList() {
    return List.generate(4, (index) => defaultRecipes[index]);
  }
}
