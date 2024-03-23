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
    emit(state.copyWith(
        recipesModelObj: state.recipesModelObj
            ?.copyWith(recipeItemList: fillRecipeItemList())));
  }

// creates 4 default recipes
  List<RecipeItemModel> defaultRecipes = [
    RecipeItemModel(
      recipeName: "Poha",
      recipeDescription: "Poha recipe description",
      ingredients: [
        IngredientsListModel(name: "Poha", quantity: "1", unit: "kg"),
        IngredientsListModel(name: "Water", quantity: "2", unit: "kg"),
        IngredientsListModel(name: "Kanda", quantity: "2", unit: "kg"),
        IngredientsListModel(name: "Batata", quantity: "2", unit: "kg"),
        IngredientsListModel(name: "oil", quantity: "1", unit: "kg"),
        IngredientsListModel(name: "Mirchi", quantity: "2", unit: "kg"),
      ],
    ),
    RecipeItemModel(
      recipeName: "Sabudana Khichdi",
      recipeDescription: "Sabudana Khichdi recipe description",
      ingredients: [
        IngredientsListModel(name: "Sabudana", quantity: "1", unit: "kg"),
        IngredientsListModel(name: "Water", quantity: "2", unit: "kg")
      ],
    ),
    RecipeItemModel(
      recipeName: "Dal Khichdi",
      recipeDescription: "Dal Khichdi recipe description",
      ingredients: [
        IngredientsListModel(name: "Dal", quantity: "1", unit: "kg"),
        IngredientsListModel(name: "Rice", quantity: "4", unit: "kg")
      ],
    ),
    RecipeItemModel(
      recipeName: "Dal Tadka",
      recipeDescription: "Dal Tadka recipe description",
      ingredients: [
        IngredientsListModel(name: "Dal", quantity: "1", unit: "kg"),
        IngredientsListModel(name: "Water", quantity: "2", unit: "kg")
      ],
    ),
  ];

  List<RecipeItemModel> fillRecipeItemList() {
    List<RecipeItemModel> firebaseRecipes = [];

    // Fetch recipes from Firestore
    FirebaseFirestore.instance
        .collection('recipes')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        // Assuming your RecipeItemModel class has a constructor that takes a Map
        RecipeItemModel recipe = RecipeItemModel.fromJson(data);
        firebaseRecipes.add(recipe);
      });
    }).catchError((error) {
      // Handle errors here
      print("Error fetching recipes: $error");
    });

    return defaultRecipes + firebaseRecipes;
  }
}
