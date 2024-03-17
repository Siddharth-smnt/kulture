import 'package:flutter/material.dart';
import 'package:mandar_purushottam_s_application1/core/app_export.dart';

class CustomFloatingButton extends StatelessWidget {
  final Alignment? alignment;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final BoxDecoration? decoration;
  final String? iconPath; // Add iconPath parameter
  CustomFloatingButton({
    Key? key,
    this.alignment,
    this.margin,
    this.backgroundColor,
    this.onPressed,
    this.width,
    this.height,
    this.decoration,
    this.iconPath, // Add iconPath parameter
  }) : super(
          key: key,
        );
  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: fabWidget,
          )
        : fabWidget;
  }

  Widget get fabWidget => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: FloatingActionButton(
          backgroundColor: backgroundColor,
          onPressed: onPressed,
          child: Container(
            alignment: Alignment.center,
            width: width ?? 56.0, // Default width
            height: height ?? 56.0, // Default height
            decoration: decoration ??
                BoxDecoration(
                  color: appTheme.orange900,
                  borderRadius: BorderRadius.circular(30.h),
                ),
            child: Icon(
              Icons.add,
              color: Colors.white, // Set icon color to white
            ),
          ),
        ),
      );
}
