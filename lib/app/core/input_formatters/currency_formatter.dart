import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  CurrencyInputFormatter({this.maxDigits = 20});
  final int maxDigits;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    try {
      String digitOnlyValue = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

      if (digitOnlyValue.isEmpty) {
        return TextEditingValue.empty;
      }

      final formatador = NumberFormat("#,###", "es_PY");
      String guaraniValue = formatador.format(int.parse(digitOnlyValue));

      return TextEditingValue(
        text: guaraniValue,
        selection: TextSelection.collapsed(offset: guaraniValue.length),
      );
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw InputFormatterError();
    }
  }
}

class InputFormatterError {}
