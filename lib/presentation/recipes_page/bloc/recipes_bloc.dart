import 'package:cloud_firestore/cloud_firestore.dart';
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
    List<RecipeItemModel> initialList = await fillRecipeItemList();
    print(initialList);
    emit(state.copyWith(
        recipesModelObj:
            state.recipesModelObj?.copyWith(recipeItemList: initialList)));
  }

// creates 4 default recipes
  List<RecipeItemModel> defaultRecipes = [
    RecipeItemModel(
      recipeName: "Poha",
      recipeDescription: "Poha recipe description",
      ingredients: [
        IngredientsListModel(name: "Poha", quantity: 1, unit: "kg"),
        IngredientsListModel(name: "Water", quantity: 2, unit: "kg"),
        IngredientsListModel(name: "Kanda", quantity: 2, unit: "kg"),
        IngredientsListModel(name: "Batata", quantity: 2, unit: "kg"),
        IngredientsListModel(name: "oil", quantity: 1, unit: "kg"),
        IngredientsListModel(name: "Mirchi", quantity: 2, unit: "kg"),
      ],
    ),
    RecipeItemModel(
      recipeName: "Sabudana Khichdi",
      recipeDescription: "Sabudana Khichdi recipe description",
      ingredients: [
        IngredientsListModel(name: "Sabudana", quantity: 1, unit: "kg"),
        IngredientsListModel(name: "Water", quantity: 2, unit: "kg")
      ],
    ),
    RecipeItemModel(
      recipeName: "Dal Khichdi",
      recipeDescription: "Dal Khichdi recipe description",
      ingredients: [
        IngredientsListModel(name: "Dal", quantity: 1, unit: "kg"),
        IngredientsListModel(name: "Rice", quantity: 4, unit: "kg")
      ],
    ),
    RecipeItemModel(
      recipeName: "Dal Tadka",
      recipeDescription: "Dal Tadka recipe description",
      ingredients: [
        IngredientsListModel(name: "Dal", quantity: 1, unit: "kg"),
        IngredientsListModel(name: "Water", quantity: 2, unit: "kg")
      ],
    ),
  ];

  Future<List<RecipeItemModel>> fillRecipeItemList() async {
    List<RecipeItemModel> firebaseRecipes = [];
    try {
      // Fetch recipes from Firestore
      var querySnapshot =
          await FirebaseFirestore.instance.collection('Recipes').get();

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data();
        // Assuming your RecipeItemModel class has a constructor that takes a Map
        RecipeItemModel recipe = RecipeItemModel.fromJson(data);
        firebaseRecipes.add(recipe);
      });
      defaultRecipes.addAll(firebaseRecipes);
      print(defaultRecipes);
      return defaultRecipes;
    } catch (e) {
      print("Error catching recipes: $e");
      return defaultRecipes;
    }
  }
}
