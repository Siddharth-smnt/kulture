class EstimateModel {
  String? id;
  String? recipeId;
  String? recipeName;
  int? people;
  EstimateModel({this.recipeName, this.people, this.id, this.recipeId});

  // Method to convert JSON object to EstimateModel object
  factory EstimateModel.fromJson(Map<String, dynamic> json) {
    return EstimateModel(
        id: json['id'],
        recipeId: json['recipeId'],
        recipeName: json['recipeName'],
        people: json['people']);
  }

  // Method to convert EstimateModel object to JSON object
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['recipeId'] = this.recipeId;
    data['recipeName'] = this.recipeName;
    data['people'] = this.people;
    return data;
  }
}
