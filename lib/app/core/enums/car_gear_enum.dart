import 'package:flutter/foundation.dart';

enum CarGearType {
  manual(1, 'MANUAL'),
  automatic(2, 'AUTOMATIC');

  static CarGearType fromString(String value) => CarGearType.values
      .firstWhere((e) => e.value.toLowerCase() == value.toLowerCase());

  static CarGearType valueOf(String value) {
    return CarGearType.values.where((e) => describeEnum(e) == value).first;
  }

  final String value;
  final int id;
  const CarGearType(this.id, this.value);
}
