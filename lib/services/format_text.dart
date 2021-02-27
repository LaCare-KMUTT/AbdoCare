import 'package:flutter/services.dart';

class UpperCaseText extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue textOld, TextEditingValue textNew) {
    return textNew.copyWith(text: textNew.text.toUpperCase());
  }
}

class LowerCaseText extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue textOld, TextEditingValue textNew) {
    return textNew.copyWith(text: textNew.text.toLowerCase());
  }
}
