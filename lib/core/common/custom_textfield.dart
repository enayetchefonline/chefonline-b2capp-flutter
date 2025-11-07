import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData prefixIcon;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType inputType;
  final String hintText;
  final String? Function(String?)? validator;
  final int maxLength;
  final int maxLines;
  final VoidCallback? onVisibilityToggle;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.prefixIcon,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    required this.inputType,
    required this.hintText,
    this.validator,
    this.onVisibilityToggle,
    this.maxLength=32,
    this.maxLines=1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: inputType,
      textCapitalization: textCapitalization,
      maxLength: maxLength,
      maxLines: maxLines,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      validator: validator,
      decoration: InputDecoration(
        counterText: '',
        prefixIcon: Icon(prefixIcon, color: Colors.grey),
        suffixIcon: obscureText
            ? IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            size: 20,
          ),
          onPressed: onVisibilityToggle,
        )
            : null,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          fontSize: 14,
        ),
      ),
    );
  }
}