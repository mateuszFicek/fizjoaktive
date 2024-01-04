import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextInputType textInputType;
  final String labelText;
  final bool obscureText;
  const TextInput({
    super.key,
    this.textInputType = TextInputType.text,
    this.labelText = "",
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
