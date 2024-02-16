class VegetableprofilItemModel {
  String itemName;
  String category;
  int quantity;

  VegetableprofilItemModel({
    required this.itemName,
    required this.category,
    required this.quantity,
  });

  factory VegetableprofilItemModel.fromJson(Map<String, dynamic> json) {
    return VegetableprofilItemModel(
      itemName: json['itemName'],
      category: json['category'],
      quantity: json['quantity'],
    );
  }
}
