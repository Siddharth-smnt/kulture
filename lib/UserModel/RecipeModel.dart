import 'package:equatable/equatable.dart';

class RecipeModel extends Equatable {
  final String? id;
  final String recipeName;
  final String recipeDescription;
  final String? imageUrl;
  final List<IngredientModel> ingredients;

  RecipeModel({
    this.id,
    required this.recipeName,
    required this.recipeDescription,
    this.imageUrl,
    required this.ingredients,
  });

  // Method to convert JSON object to RecipeModel object
  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    List<IngredientModel> ingredients = [];
    if (json['ingredients'] != null) {
      json['ingredients'].forEach((ingredient) {
        ingredients.add(IngredientModel.fromJson(ingredient));
      });
    }
    return RecipeModel(
      id: json['id'],
      recipeName: json['recipeName'],
      recipeDescription: json['recipeDescription'],
      imageUrl: json['imageUrl'],
      ingredients: ingredients,
    );
  }

  // Method to convert RecipeModel object to JSON object
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['recipeName'] = this.recipeName;
    data['recipeDescription'] = this.recipeDescription;
    data['imageUrl'] = this.imageUrl;
    data['ingredients'] =
        this.ingredients.map((ingredient) => ingredient.toJson()).toList();
    return data;
  }

  @override
  List<Object?> get props =>
      [id, recipeName, recipeDescription, imageUrl, ingredients];
}

class IngredientModel {
  String name;
  int quantity;
  String unit;
  IngredientModel({
    required this.name,
    required this.quantity,
    required this.unit,
  });

  // Method to convert JSON object to IngredientModel object
  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(
      name: json['name'],
      quantity: json['quantity'],
      unit: json['unit'],
    );
  }

  // Method to convert IngredientModel object to JSON object
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': this.name,
      'quantity': this.quantity,
      'unit': this.unit,
    };
    return data;
  }
}
