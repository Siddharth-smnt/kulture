class InventoryModel {
  String? id;
  String itemName;
  String category;
  int quantity;
  String unit;

  InventoryModel({
    this.id,
    required this.category,
    required this.itemName,
    required this.quantity,
    required this.unit,
  });

  // Method to convert JSON object to InventoryModel object
  factory InventoryModel.fromJson(Map<String, dynamic> json) {
    return InventoryModel(
      id: json['id'],
      itemName: json['itemName'],
      category: json['category'],
      quantity: json['quantity'],
      unit: json['unit'],
    );
  }

  // Method to convert InventoryModel object to JSON object
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['itemName'] = this.itemName;
    data['category'] = this.category;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}
