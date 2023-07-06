import '../../domain/entities/search_filter/car_manufacturer_entity.dart';
import '../../domain/entities/search_filter/car_model_entity.dart';
import '../../domain/entities/search_filter/car_year_entity.dart';

class CarManufacturerEntityMapper {
  static CarManufacturerEntity fromMap(Map<String, dynamic> map) {
    return CarManufacturerEntity(
      uid: map['id'],
      name: map['manufacturer'],
      models: (map['models'] as List)
          .map((map) => CarModelEntityMapper.fromMap(map))
          .toList(),
    );
  }

  static List<CarManufacturerEntity> fromListMap(
      List<Map<String, dynamic>> list) {
    return list.map((map) => CarManufacturerEntityMapper.fromMap(map)).toList();
  }
}

class CarModelEntityMapper {
  static CarModelEntity fromMap(Map<String, dynamic> map) {
    return CarModelEntity(
      name: map['model'],
      years: (map['years'] as List)
          .map((map) => CarYearEntityMapper.fromString(map))
          .toList(),
    );
  }
}

class CarYearEntityMapper {
  static CarYearEntity fromString(String value) {
    return CarYearEntity(year: value);
  }
}
