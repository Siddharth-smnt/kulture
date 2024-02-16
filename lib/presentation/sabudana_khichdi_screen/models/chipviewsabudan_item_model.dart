// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [chipviewsabudan_item_widget] screen.
class ChipviewsabudanItemModel extends Equatable {
  ChipviewsabudanItemModel({
    this.sabudana = "Sabudana",
    this.isSelected = false,
  }) {}

  String sabudana;

  bool isSelected;

  ChipviewsabudanItemModel copyWith({
    String? sabudana,
    bool? isSelected,
  }) {
    return ChipviewsabudanItemModel(
      sabudana: sabudana ?? this.sabudana,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [sabudana, isSelected];
}
