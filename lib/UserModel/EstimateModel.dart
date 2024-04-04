import 'package:mandar_purushottam_s_application1/UserModel/RecipeModel.dart';

class EstimateModel {
  String? id;
  String? recipeId;
  String? recipeName;
  int? noOfDishes;
  int? peopleCount;
  List<IngredientModel>? notAvailableItems;
  EstimateModel(
      {this.recipeName,
      this.peopleCount,
      this.noOfDishes,
      this.id,
      this.recipeId,
      this.notAvailableItems});

  // Method to convert JSON object to EstimateModel object
  factory EstimateModel.fromJson(Map<String, dynamic> json) {
    List<IngredientModel> ingredients = [];
    if (json['notAvailableItems'] != null) {
      json['notAvailableItems'].forEach((ingredient) {
        ingredients.add(IngredientModel.fromJson(ingredient));
      });
    }
    return EstimateModel(
      id: json['id'],
      recipeId: json['recipeId'],
      recipeName: json['recipeName'],
      peopleCount: json['peopleCount'],
      noOfDishes: json['noOfDishes'],
      notAvailableItems: ingredients,
    );
  }

  // Method to convert EstimateModel object to JSON object
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['recipeId'] = this.recipeId;
    data['recipeName'] = this.recipeName;
    data['peopleCount'] = this.peopleCount;
    data['noOfDishes'] = this.noOfDishes;
    data['notAvailableItems'] = this
        .notAvailableItems
        ?.map((ingredient) => ingredient.toJson())
        .toList();
    return data;
  }
}
