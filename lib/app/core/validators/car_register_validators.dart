import '../enums/car_fuel_type_enum.dart';
import '../enums/car_gear_enum.dart';

class CarValidators {
  static String? validateManufacturer(String? value) {
    if (value!.isEmpty) {
      return 'Informe o Fabricante';
    }
    return null;
  }

  static String? validateModel(String? value) {
    if (value!.isEmpty) {
      return 'Informe o modelo';
    }
    return null;
  }

  static String? validateYear(String? value) {
    if (value!.isEmpty) {
      return 'Informe o ano';
    }
    return null;
  }

  static String? validateColor(String? value) {
    if (value!.isEmpty) {
      return 'Informe a cor';
    }
    return null;
  }

  static String? validateFuel(CarFuelTypeENUM? value) {
    if (value == null) {
      return 'Selecione o Combustivel';
    }
    return null;
  }

  static String? validateGear(CarGearTypeENUM? value) {
    if (value == null) {
      return 'Selecione o Cambio';
    }
    return null;
  }
}
