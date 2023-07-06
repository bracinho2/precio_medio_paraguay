import 'package:flutter/material.dart';

extension EsPY on String {
  String translate() {
    final value = esPY[this];
    if (value != null) {
      return value;
    }
    return this;
  }
}

final esPY = {
  'private': 'Venta Personal',
  'manual': 'Caja Manual',
  'NAFTA': 'Combustible Nafta',
};

class LocalizationApp {
  final Locale locale;
  LocalizationApp(this.locale);
}
