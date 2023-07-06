import 'package:precio_medio_paraguay/app/modules/regioes/dominio/entities/municipio_entity.dart';

import '../../modules/regioes/dominio/entities/departamento_entity.dart';
import '../../modules/search_page/domain/entities/search_filter/car_manufacturer_entity.dart';
import '../../modules/search_page/domain/entities/search_filter/car_model_entity.dart';
import '../../modules/search_page/domain/entities/search_filter/car_year_entity.dart';

class Validators {
  static String? selectCarManufacturer(CarManufacturerEntity? value) {
    return value == null ? 'You have not selected an item' : null;
  }

  static String? selectCarModel(CarModelEntity? value) {
    return value == null ? 'You have not selected an item' : null;
  }

  static String? selectCarYear(CarYearEntity? value) {
    return value == null ? 'You have not selected an item' : null;
  }

  static String? validateCompleteName(String? value) {
    if (value!.isEmpty) {
      return 'Informe seu nome';
    } else if (value.split(' ').length < 2) {
      return 'Informe seu nome e sobrenome';
    }
    return null;
  }

  static String? validadeIdentify(String? value) {
    if (value!.isEmpty) {
      return 'Informe sua Identificação';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);

    if (value!.isEmpty) {
      return 'Digite um email';
    } else if (!regex.hasMatch(value)) {
      return 'Informe um email válido';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Digite uma senha';
    } else if (value.length < 6) {
      return 'A senha necessita 6 caracteres';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    RegExp regex = RegExp(r'^\+595\d{9}$|^09\d{8}$');

    if (value!.isEmpty) {
      return 'Digite um celular';
    } else if (!regex.hasMatch(value)) {
      return 'Informe um celular válido';
    }
    return null;
  }

  static String? validateDepartament(DepartamentoEntity? value) {
    return value == null ? 'Selecione um departamento' : null;
  }

  static String? validateCity(MunicipioEntity? value) {
    return value == null ? 'Selecione uma cidade' : null;
  }
}

class ParaguayRUCValidator {
  RegExp regexFormat = RegExp(r'^(\d|\.|\-)+$');
  RegExp regexAdjust = RegExp(r'\D');
  int baseMod = 11;

  bool _validateRUC(String? ruc) {
    if (ruc == null) return false;

    if (!regexFormat.hasMatch(ruc)) return false;

    String adjustedRuc = ruc.replaceAll(regexAdjust, '');
    if (![8, 9].contains(adjustedRuc.length)) return false;

    int identityDigitsLength = adjustedRuc.length - 2;
    int valueSum = 0;
    int increasingSequenceQtd = 0;
    int decreasingSequenceQtd = 0;
    int equalsDigitQtd = 0;
    for (int index = identityDigitsLength, multiplier = 2;
        index >= 0;
        index -= 1, multiplier += 1) {
      valueSum += int.parse(adjustedRuc[index]) * multiplier;

      if (index > 0) {
        int previousDigit = int.parse(adjustedRuc[index - 1]);
        int currentDigit = int.parse(adjustedRuc[index]);
        if (previousDigit == currentDigit) equalsDigitQtd += 1;

        if (currentDigit > previousDigit) increasingSequenceQtd += 1;

        if (previousDigit > currentDigit) decreasingSequenceQtd += 1;
      }
    }

    if (increasingSequenceQtd >= 6 ||
        decreasingSequenceQtd >= 6 ||
        equalsDigitQtd >= 6) return false;

    int mod = valueSum % baseMod;
    int verifyDigit = mod > 1 ? baseMod - mod : 0;

    return adjustedRuc[identityDigitsLength + 1] == verifyDigit.toString();
  }

  bool validateIndividualRUC(String? ruc) =>
      ruc != null &&
      ruc.replaceAll(regexAdjust, '').length == 8 &&
      _validateRUC(ruc);

  bool validateCompanyRUC(String? ruc) =>
      ruc != null &&
      ruc.replaceAll(regexAdjust, '').length == 9 &&
      _validateRUC(ruc);
}

class LoginValidators {
  static String? validateEmail(String? value) {
    return value == null || value.isEmpty ? 'Informe seu email' : null;
  }

  static String? validatePassword(String? value) {
    return value == null || value.isEmpty ? 'Informe seu password' : null;
  }
}
