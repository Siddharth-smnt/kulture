class UserItem {
  String userId;
  String category;
  String itemName;
  int quantity;

  UserItem({
    required this.userId,
    required this.category,
    required this.itemName,
    required this.quantity,
  });

  // Method to convert JSON object to UserItem object
  factory UserItem.fromJson(Map<String, dynamic> json) {
    return UserItem(
      userId: json['userId'],
      category: json['category'],
      itemName: json['itemName'],
      quantity: json['quantity'],
    );
  }

  // Method to convert UserItem object to JSON object
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['category'] = this.category;
    data['itemName'] = this.itemName;
    data['quantity'] = this.quantity;
    return data;
  }
}
