// ignore_for_file: must_be_immutable

part of 'kitchen_bloc.dart';

/// Represents the state of Kitchen in the application.
class KitchenState extends Equatable {
  KitchenState({this.kitchenList = const []});

  List<InventoryModel> kitchenList;

  KitchenState copyWith({List<InventoryModel>? kitchenList}) {
    return KitchenState(kitchenList: kitchenList ?? this.kitchenList);
  }

  @override
  List<Object?> get props => [kitchenList];
}
