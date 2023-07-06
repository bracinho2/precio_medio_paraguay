enum CarSaleTypeENUM {
  direct(1, 'PERSONAL'),
  resale(2, 'REVENTA'),
  other(3, 'OTRO');

  final String value;
  final int id;
  const CarSaleTypeENUM(this.id, this.value);

  static CarSaleTypeENUM fromString(String value) =>
      CarSaleTypeENUM.values.firstWhere(
        (e) => e.value == value,
        orElse: () => CarSaleTypeENUM.direct,
      );

  static String? isSelected(CarSaleTypeENUM? value) {
    if (value == null) {
      return 'Selecione o tipo de informe';
    }
    return null;
  }
}
