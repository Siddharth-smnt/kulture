import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/UserModel/RecipeModel.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/models/recipes_model.dart';
import '/core/app_export.dart';
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
    List<RecipeModel> initialList = await fillRecipeItemList();
    print(initialList);
    emit(state.copyWith(
        recipesModelObj:
            state.recipesModelObj?.copyWith(recipeItemList: initialList)));
  }

// creates 4 default recipes
  List<RecipeModel> defaultRecipes = [
    RecipeModel(
      recipeName: "Poha",
      recipeDescription: "Poha recipe description",
      ingredients: [
        IngredientModel(name: "Poha", quantity: 1, unit: "kg"),
        IngredientModel(name: "Water", quantity: 2, unit: "kg"),
        IngredientModel(name: "Kanda", quantity: 2, unit: "kg"),
        IngredientModel(name: "Batata", quantity: 2, unit: "kg"),
        IngredientModel(name: "oil", quantity: 1, unit: "kg"),
        IngredientModel(name: "Mirchi", quantity: 2, unit: "kg"),
      ],
    ),
    RecipeModel(
      recipeName: "Sabudana Khichdi",
      recipeDescription: "Sabudana Khichdi recipe description",
      ingredients: [
        IngredientModel(name: "Sabudana", quantity: 1, unit: "kg"),
        IngredientModel(name: "Water", quantity: 2, unit: "kg")
      ],
    ),
    RecipeModel(
      recipeName: "Dal Khichdi",
      recipeDescription: "Dal Khichdi recipe description",
      ingredients: [
        IngredientModel(name: "Dal", quantity: 1, unit: "kg"),
        IngredientModel(name: "Rice", quantity: 4, unit: "kg")
      ],
    ),
    RecipeModel(
      recipeName: "Dal Tadka",
      recipeDescription: "Dal Tadka recipe description",
      ingredients: [
        IngredientModel(name: "Dal", quantity: 1, unit: "kg"),
        IngredientModel(name: "Water", quantity: 2, unit: "kg")
      ],
    ),
  ];

  Future<List<RecipeModel>> fillRecipeItemList() async {
    List<RecipeModel> firebaseRecipes = [];
    try {
      // Fetch recipes from Firestore
      var querySnapshot =
          await FirebaseFirestore.instance.collection('Recipes').get();

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data();
        // Assuming your RecipeModel class has a constructor that takes a Map
        RecipeModel recipe = RecipeModel.fromJson(data);
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
