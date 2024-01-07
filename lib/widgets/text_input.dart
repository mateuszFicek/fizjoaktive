import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextInputType textInputType;
  final String labelText;
  final bool? obscureText;
  final TextEditingController controller;
  final VoidCallback? togglePasswordObscure;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;

  const TextInput({
    super.key,
    required this.controller,
    this.textInputType = TextInputType.text,
    this.labelText = "",
    this.obscureText,
    this.togglePasswordObscure,
    this.onEditingComplete,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      controller: controller,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        suffixIcon: obscureText != null ? visibilityButton() : null,
      ),
    );
  }

  Widget visibilityButton() {
    return SizedBox(
      height: 24,
      child: InkWell(
        onTap: togglePasswordObscure,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            obscureText! ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
    );
  }
}
