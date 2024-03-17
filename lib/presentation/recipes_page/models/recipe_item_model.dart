/// This class is used in the [recipe_item_widget] screen.
class RecipeItemModel {
  RecipeItemModel({
    this.id,
    required this.recipeName,
    this.description,
    this.ingredients,
    this.imageAddress,
  });

  int? id;
  String recipeName;
  String? description;
  List<IngredientsListModel>? ingredients;
  String? imageAddress;
}

class IngredientsListModel {
  IngredientsListModel({required this.ingredientName, this.quantity});
  String ingredientName;
  String? quantity;
}
