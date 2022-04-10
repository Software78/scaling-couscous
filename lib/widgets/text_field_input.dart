import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    required this.controller,
    required this.enabledBorder,
    required this.filled,
    required this.inputBorder,
    required this.focusedBorder,
    required this.hinTtext,
    required this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController controller;
  final InputBorder inputBorder;
  final String hinTtext;
  final InputBorder focusedBorder;
  final InputBorder enabledBorder;
  final bool filled;
  final TextInputType keyboardType;
  final bool obscureText;

  @override
  TextField build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: inputBorder,
        hintText: hinTtext,
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
        filled: filled,
        contentPadding: const EdgeInsets.all(8.0),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}
