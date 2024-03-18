class RecipeItemModel {
  RecipeItemModel({
    this.id,
    required this.recipeName,
    this.description,
    this.ingredients,
    this.imageAddress,
  });

  int? id; // Optional ID
  String recipeName; // Name of the recipe
  String? description; // Description of the recipe (optional)
  List<IngredientsListModel>?
      ingredients; // List of ingredients for the recipe (optional)
  String? imageAddress; // Optional image address
}

class IngredientsListModel {
  IngredientsListModel({
    required this.ingredientName,
    this.quantity,
  });

  String ingredientName; // Name of the ingredient
  String? quantity; // Quantity of the ingredient (optional)
}
