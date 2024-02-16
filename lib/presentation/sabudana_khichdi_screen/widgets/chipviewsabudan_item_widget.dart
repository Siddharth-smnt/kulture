import '../models/chipviewsabudan_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class ChipviewsabudanItemWidget extends StatelessWidget {
  ChipviewsabudanItemWidget(
    this.chipviewsabudanItemModelObj, {
    Key? key,
    this.onSelectedChipView,
  }) : super(
          key: key,
        );

  ChipviewsabudanItemModel chipviewsabudanItemModelObj;

  Function(bool)? onSelectedChipView;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent,
      ),
      child: RawChip(
        padding: EdgeInsets.symmetric(
          horizontal: 30.h,
          vertical: 11.v,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          chipviewsabudanItemModelObj.sabudana,
          style: TextStyle(
            color: theme.colorScheme.secondaryContainer,
            fontSize: 14.fSize,
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w600,
          ),
        ),
        selected: chipviewsabudanItemModelObj.isSelected,
        backgroundColor: Colors.transparent,
        selectedColor: Colors.transparent,
        shape: chipviewsabudanItemModelObj.isSelected
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: theme.colorScheme.onPrimaryContainer,
                  width: 1.h,
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide(
                  color: theme.colorScheme.onPrimaryContainer,
                  width: 1.h,
                ),
              ),
        onSelected: (value) {
          onSelectedChipView?.call(value);
        },
      ),
    );
  }
}
