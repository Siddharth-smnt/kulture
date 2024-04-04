import 'package:mandar_purushottam_s_application1/UserModel/RecipeModel.dart';

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
