import 'package:mandar_purushottam_s_application1/presentation/recipes_page/add_recipe.dart';

class RecipeItems {
  String userId;
  String name;
  String description;
  List<Entry> items;

  RecipeItems({
    required this.userId,
    required this.name,
    required this.description,
    required this.items,
  });

  // Method to convert JSON object to RecipeItems object
  factory RecipeItems.fromJson(Map<String, dynamic> json) {
    return RecipeItems(
      userId: json['userId'],
      name: json['name'],
      description: json['description'],
      items: json['items'],
    );
  }

  // Method to convert RecipeItems object to JSON object
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['items'] = this.items;
    return data;
  }
}
