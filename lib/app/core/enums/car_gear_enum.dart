enum CarGearTypeENUM {
  automatic(1, 'AUTOMATICO'),
  manual(2, 'MANUAL');

  final String value;
  final int id;
  const CarGearTypeENUM(this.id, this.value);

  static CarGearTypeENUM fromString(String value) =>
      CarGearTypeENUM.values.firstWhere(
        (e) => e.value.toLowerCase() == value.toLowerCase(),
        orElse: () => CarGearTypeENUM.manual,
      );

  static String? validator(CarGearTypeENUM? value) {
    if (value == null) {
      return 'Selecione tipo de cambio do veiculo';
    }
    return null;
  }

  factory CarGearTypeENUM.fromAPI(String value) {
    return CarGearTypeENUM.values.firstWhere(
      (e) => e.value.toLowerCase() == value.toLowerCase(),
      orElse: () => CarGearTypeENUM.automatic,
    );
  }

  static bool? hasError(CarGearTypeENUM? value) {
    if (value == null) {
      return true;
    }
    return null;
  }
}
