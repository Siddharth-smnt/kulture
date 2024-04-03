import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.textStyles,
    this.buttonColor,
  }) : super(key: key);

  final String text;
  final TextStyle? textStyles;
  final VoidCallback onTap;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: buttonColor, // Set button color
        minimumSize: const Size(double.infinity, 40),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: textStyles,
      ),
    );
  }
}
