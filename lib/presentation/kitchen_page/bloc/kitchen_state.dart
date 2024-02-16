// ignore_for_file: must_be_immutable

part of 'kitchen_bloc.dart';

/// Represents the state of Kitchen in the application.
class KitchenState extends Equatable {
  KitchenState({this.kitchenModelObj});

  KitchenModel? kitchenModelObj;

  @override
  List<Object?> get props => [
        kitchenModelObj,
      ];
  KitchenState copyWith({KitchenModel? kitchenModelObj}) {
    return KitchenState(
      kitchenModelObj: kitchenModelObj ?? this.kitchenModelObj,
    );
  }
}
