// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'condiment_item_model.dart';
import 'vegetableprofil_item_model.dart';

/// This class defines the variables used in the [kitchen_page],
/// and is typically used to hold data that is passed between different parts of the application.
class KitchenModel extends Equatable {
  KitchenModel({
    this.condimentItemList = const [],
    this.vegetableprofilItemList = const [],
  }) {}

  List<CondimentItemModel> condimentItemList;

  List<VegetableprofilItemModel> vegetableprofilItemList;

  KitchenModel copyWith({
    List<CondimentItemModel>? condimentItemList,
    List<VegetableprofilItemModel>? vegetableprofilItemList,
  }) {
    return KitchenModel(
      condimentItemList: condimentItemList ?? this.condimentItemList,
      vegetableprofilItemList:
          vegetableprofilItemList ?? this.vegetableprofilItemList,
    );
  }

  @override
  List<Object?> get props => [condimentItemList, vegetableprofilItemList];
}
