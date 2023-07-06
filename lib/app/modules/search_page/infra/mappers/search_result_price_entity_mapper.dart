import 'package:precio_medio_paraguay/app/core/enums/car_fuel_type_enum.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_gear_enum.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/domain/entities/search_result/search_result_price_entity.dart';

import '../../../../core/enums/car_sale_type_enum.dart';

class SearchResultPriceEntityMapper {
  static SearchResultPriceEntity fromMap(Map<String, dynamic> map) {
    return SearchResultPriceEntity(
      uid: map['uid'],
      manufacturer: map['manufacturer'],
      model: map['model'],
      departamento: map['departamento'],
      municipio: map['municipio'],
      saleType: CarSaleTypeENUM.fromString(map['saleType']),
      dolar: double.parse(map['dolar']),
      guarani: double.parse(map['guarani']),
      color: map['color'],
      gear: CarGearTypeENUM.fromString(map['gear']),
      fuel: CarFuelTypeENUM.fromString(map['fuel']),
      ondometer: double.parse(map['ondometer']),
      year: map['year'],
      informedBy: map['informedBy'],
      phone: map['phone'],
      email: map['email'],
      anouncementDate: map['anouncementDate'],
    );
  }
}
