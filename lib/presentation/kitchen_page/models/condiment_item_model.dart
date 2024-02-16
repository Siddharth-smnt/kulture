class CondimentItemModel {
  String itemName;
  String category;
  int quantity;

  CondimentItemModel({
    required this.itemName,
    required this.category,
    required this.quantity,
  });

  factory CondimentItemModel.fromJson(Map<String, dynamic> json) {
    return CondimentItemModel(
      itemName: json['itemName'],
      category: json['category'],
      quantity: json['quantity'],
    );
  }
}
