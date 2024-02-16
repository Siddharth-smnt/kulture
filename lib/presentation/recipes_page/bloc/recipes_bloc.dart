import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/recipe_item_model.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/models/recipes_model.dart';
part 'recipes_event.dart';
part 'recipes_state.dart';

/// A bloc that manages the state of a Recipes according to the event that is dispatched to it.
class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  RecipesBloc(RecipesState initialState) : super(initialState) {
    on<RecipesInitialEvent>(_onInitialize);
  }

  _onInitialize(
    RecipesInitialEvent event,
    Emitter<RecipesState> emit,
  ) async {
    emit(state.copyWith(
        recipesModelObj: state.recipesModelObj
            ?.copyWith(recipeItemList: fillRecipeItemList())));
  }

  List<RecipeItemModel> fillRecipeItemList() {
    return List.generate(4, (index) => RecipeItemModel());
  }
}
