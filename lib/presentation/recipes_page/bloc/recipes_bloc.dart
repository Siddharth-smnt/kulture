import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/UserModel/RecipeModel.dart';
import 'package:mandar_purushottam_s_application1/presentation/recipes_page/models/recipes_model.dart';
import 'package:mandar_purushottam_s_application1/services/authentication/authentication.dart';
import '/core/app_export.dart';
part 'recipes_event.dart';
part 'recipes_state.dart';

/// A bloc that manages the state of a Recipes according to the event that is dispatched to it.
class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  RecipesBloc(RecipesState initialState) : super(initialState) {
    on<RecipesInitialEvent>(_onInitialize);
    on<RefreshRecipesEvent>(_refreshRecipes);
  }

  void _refreshRecipes(
      RefreshRecipesEvent event, Emitter<RecipesState> emit) async {
    List<RecipeModel> newList = await fillRecipeItemList();
    emit(state.copyWith(
        recipesModelObj:
            state.recipesModelObj?.copyWith(recipeItemList: newList)));
  }

  void _onInitialize(
    RecipesInitialEvent event,
    Emitter<RecipesState> emit,
  ) async {
    List<RecipeModel> initialList = await fillRecipeItemList();
    emit(state.copyWith(
        recipesModelObj:
            state.recipesModelObj?.copyWith(recipeItemList: initialList)));
  }


  Future<List<RecipeModel>> fillRecipeItemList() async {
    final AuthServices _auth = AuthServices();
    List<RecipeModel> firebaseRecipes = [];
    try {
      // Fetch recipes from Firestore
      var querySnapshot = await FirebaseFirestore.instance
          .collection("User")
          .doc(_auth.user?.uid)
          .collection('Recipes')
          .get();

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data();
        // Assuming your RecipeModel class has a constructor that takes a Map
        RecipeModel recipe = RecipeModel.fromJson(data);
        firebaseRecipes.add(recipe);
      });
      return firebaseRecipes;
    } catch (e) {
      print("Error catching recipes: $e");
      return [];
    }
  }
}
