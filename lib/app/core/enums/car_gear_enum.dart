enum CarGearType {
  manual(1, 'MANUAL'),
  automatic(2, 'AUTOMATIC');

  static CarGearType fromString(String value) =>
      CarGearType.values.firstWhere((e) => e.value == value);

  final String value;
  final int id;
  const CarGearType(this.id, this.value);
}
