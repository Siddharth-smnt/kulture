/// This class is used in the [recipe_item_widget] screen.
class RecipeItemModel {
  RecipeItemModel({
    this.recipeName,
    this.id,
  }) {
    recipeName = recipeName ?? "Shahi Biryani";
    id = id ?? "";
  }

  String? recipeName;

  String? id;
}
