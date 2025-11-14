import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;


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
    this.onTap,
    this.maxLength=32,
    this.maxLines=1,
    this.inputFormatters
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
      onTap: onTap,
      inputFormatters: inputFormatters,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      validator: validator,
      decoration: InputDecoration(
        counterText: '',
        prefixIcon: Icon(prefixIcon, color: Colors.grey, size: 18),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 30,
          minHeight: 30,
        ),
        suffixIcon: onVisibilityToggle != null
            ? Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: onVisibilityToggle,
            child: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              size: 18,
            ),
          ),
        )
            : null,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 30,
          minHeight: 30,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          fontSize: 14,
        ),
        errorStyle: TextStyle(height: 0),

      ),
    );
  }
}