enum CarFuelTypeENUM {
  alcohol(1, 'ALCOHOL'),
  diesel(2, 'DIESEL'),
  electrical(3, 'ELETRICO'),
  flex(4, 'FLEX'),
  gasoline(5, 'NAFTA');

  final String name;
  final int id;

  const CarFuelTypeENUM(
    this.id,
    this.name,
  );

  static CarFuelTypeENUM fromString(String name) => CarFuelTypeENUM.values
      .firstWhere((e) => e.name.toLowerCase() == name.toLowerCase(),
          orElse: () => CarFuelTypeENUM.gasoline);

  static String? validator(CarFuelTypeENUM? name) {
    if (name == null) {
      return 'Selecione o Combustivel';
    }
    return null;
  }

  static bool? hasError(CarFuelTypeENUM? name) {
    if (name == null) {
      return true;
    }
    return null;
  }
}
