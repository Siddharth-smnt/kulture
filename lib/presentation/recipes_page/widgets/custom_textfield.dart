import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextField({
    required this.controller,
    required this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_textListener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_textListener);
    super.dispose();
  }

  void _textListener() {
    setState(() {
      _hasText = widget.controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey),
      ),
      // Change text color to black if text is entered
      // Otherwise, keep it the same color as hint text
      // You can adjust the logic here as needed
      // This logic assumes you want to change the text color to black when there's text.
      // Adjust the condition as per your requirement.
      style: TextStyle(color: _hasText ? Colors.black : Colors.grey),
    );
  }
}
