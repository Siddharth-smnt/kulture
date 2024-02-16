// ignore_for_file: must_be_immutable

part of 'kitchen_container_bloc.dart';

/// Represents the state of KitchenContainer in the application.
class KitchenContainerState extends Equatable {
  KitchenContainerState({this.kitchenContainerModelObj});

  KitchenContainerModel? kitchenContainerModelObj;

  @override
  List<Object?> get props => [
        kitchenContainerModelObj,
      ];
  KitchenContainerState copyWith(
      {KitchenContainerModel? kitchenContainerModelObj}) {
    return KitchenContainerState(
      kitchenContainerModelObj:
          kitchenContainerModelObj ?? this.kitchenContainerModelObj,
    );
  }
}
