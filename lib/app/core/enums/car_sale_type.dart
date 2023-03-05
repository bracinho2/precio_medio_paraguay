enum CarSaleType {
  private(1, 'PRIVATE'),
  resale(2, 'RESALE');

  static CarSaleType fromString(String value) =>
      CarSaleType.values.firstWhere((e) => e.value == value);

  final String value;
  final int id;
  const CarSaleType(this.id, this.value);
}
