
import 'package:flutter/services.dart';

class CapitalizeFirstLetterFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    if (text.isEmpty) return newValue;
    final capitalized =
        text[0].toUpperCase() + (text.length > 1 ? text.substring(1) : '');

    return newValue.copyWith(
      text: capitalized,
      selection: TextSelection.collapsed(offset: capitalized.length),
    );
  }
}