import 'package:precio_medio_paraguay/app/core/enums/car_gear_enum.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_sale_type.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/errors/errors.dart';

class CarMapper {
  static CarEntity fromMap(Map<String, dynamic> map) {
    try {
      return CarEntity(
        id: map['id'],
        name: map['name'],
        manufacturer: map['manufacturer'],
        year: map['year'],
        gear: CarGearType.fromString(map['gear']),
        color: map['color'],
        saleType: CarSaleType.fromString(map['saleType']),
        municipio: map['municipio'],
        departamento: map['departamento'],
        informedAt: map['informedAt'],
        updateAt: map['updateAt'],
        informedByID: map['informedByID'],
      );
    } catch (e, s) {
      throw CarRegisterError(
        message: e.toString(),
        stackTrace: s,
        label: 'Car Register Mapper Error',
      );
    }
  }

  static Map<String, dynamic> toMap({required CarEntity car}) {
    try {
      return {
        'id': car.getID,
        'name': car.getName,
        'manufacturer': car.getManufacturer,
        'year': car.getModelYear,
        'gear': car.getGearType.value,
        'color': car.getColor,
        'saleType': car.getSaleType.value,
        'municipio': car.getMunicipio,
        'departamento': car.getDepartamento,
        'informedAt': car.getInformedAt,
        'updateAt': car.getUpdateAt,
        'informedByID': car.getInformedByID,
      };
    } catch (e, s) {
      throw CarRegisterError(
        message: e.toString(),
        stackTrace: s,
        label: 'Car Register Mapper Error',
      );
    }
  }
}
