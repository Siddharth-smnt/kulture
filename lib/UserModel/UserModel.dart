import 'package:mandar_purushottam_s_application1/UserModel/InventoryModel.dart';
import 'package:mandar_purushottam_s_application1/UserModel/RecipeModel.dart';

class UserModel {
  String uid;
  String name;
  InventoryModel? inventory;
  RecipeModel? recipes;

  UserModel({
    required this.uid,
    required this.name,
    this.inventory,
    this.recipes,
  });

// Method to convert JSON object to UserModel object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      name: json['name'],
      inventory: json['inventory'] != null
          ? InventoryModel.fromJson(json['inventory'])
          : null,
      recipes: json['recipes'] != null
          ? RecipeModel.fromJson(json['recipes'])
          : null,
    );
  }

  // Method to convert UserModel object to JSON object
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    if (this.inventory != null) {
      data['inventory'] = this.inventory!.toJson();
    }
    if (this.recipes != null) {
      data['recipes'] = this.recipes!.toJson();
    }
    return data;
  }
}

/*
  USERS <C> [
    {
      uid = 123
      name = Aditya

      INVENTORY <C> [
        {
          id = item1
          itemName = potato
          category = vegetable
          quantity = 1
          unit = kg
        }
      ]

      RECIPES <C> [
        {
          
        }
      ]
    }
  ]
*/