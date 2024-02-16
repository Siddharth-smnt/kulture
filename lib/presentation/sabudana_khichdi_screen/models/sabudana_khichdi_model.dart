// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'chipviewsabudan_item_model.dart';

/// This class defines the variables used in the [sabudana_khichdi_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SabudanaKhichdiModel extends Equatable {
  final String userId;
  List<ChipviewsabudanItemModel> chipviewsabudanItemList;

  SabudanaKhichdiModel({
    required this.userId,
    this.chipviewsabudanItemList = const [],
  });

  @override
  List<Object?> get props => [userId, chipviewsabudanItemList];

  SabudanaKhichdiModel copyWith({
    String? userId,
    List<ChipviewsabudanItemModel>? chipviewsabudanItemList,
  }) {
    return SabudanaKhichdiModel(
      userId: userId ?? this.userId,
      chipviewsabudanItemList: chipviewsabudanItemList ?? this.chipviewsabudanItemList,
    );
  }
}
