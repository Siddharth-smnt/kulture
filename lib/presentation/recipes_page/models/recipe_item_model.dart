/// This class is used in the [recipe_item_widget] screen.
class RecipeItemModel {
  RecipeItemModel({
    this.id,
    required this.recipeName,
    this.recipeDescription,
    this.ingredients,
    this.imageUrl,
  });

  int? id;
  String recipeName;
  String? recipeDescription;
  List<IngredientsListModel>? ingredients;
  String? imageUrl;

  // Method to convert JSON object to RecipeItemModel object
  factory RecipeItemModel.fromJson(Map<String, dynamic> json) {
    List<IngredientsListModel> ingredients = [];
    if (json['ingredients'] != null) {
      json['ingredients'].forEach((ingredient) {
        ingredients.add(IngredientsListModel.fromJson(ingredient));
      });
    }
    return RecipeItemModel(
      id: json['id'],
      recipeName: json['recipeName'],
      recipeDescription: json['recipeDescription'],
      imageUrl: json['imageUrl'],
      ingredients: ingredients,
    );
  }
}

class IngredientsListModel {
  IngredientsListModel(
      {required this.name, required this.quantity, required this.unit});
  String name;
  String quantity;
  String unit;
  // Method to convert JSON object to IngredientsListModel object
  factory IngredientsListModel.fromJson(Map<String, dynamic> json) {
    return IngredientsListModel(
      name: json['name'],
      quantity: json['quantity'],
      unit: json['unit'],
    );
  }
}
