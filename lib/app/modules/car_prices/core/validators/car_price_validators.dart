import 'package:precio_medio_paraguay/app/core/enums/car_fuel_type_enum.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_gear_enum.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_sale_type_enum.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/entities/departamento_entity.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/entities/municipio_entity.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';

class CarPriceValidators {
  static String? validateCar(CarEntity? value) {
    if (value == null) {
      return 'Selecione o Veiculo';
    }
    return null;
  }

  static String? validateDepartament(DepartamentoEntity? value) {
    if (value == null) {
      return 'Selecione o Departamento';
    }
    return null;
  }

  static String? validateCity(MunicipioEntity? value) {
    if (value == null) {
      return 'Selecione o Municipio';
    }
    return null;
  }

  static String? validateSaleType(CarSaleTypeENUM? value) {
    if (value == null) {
      return 'Selecione o Tipo de Venda';
    }
    return null;
  }

  static String? validatePrice(String? value) {
    if (value!.isEmpty) {
      return 'Informe o Preço';
    }
    return null;
  }

  static String? validateYear(String? value) {
    if (value!.isEmpty) {
      return 'Informe o Ano';
    }
    return null;
  }

  static String? validateColor(String? value) {
    if (value!.isEmpty) {
      return 'Informe a Cor';
    }
    return null;
  }

  static String? validateFuel(CarFuelTypeENUM? value) {
    if (value == null) {
      return 'Selecione o Combustível';
    }
    return null;
  }

  static String? validateGear(CarGearTypeENUM? value) {
    if (value == null) {
      return 'Selecione o Cambio';
    }
    return null;
  }

  static String? validateDate(String? value) {
    if (value!.isEmpty) {
      return 'Informe uma Data';
    }
    return null;
  }
}
