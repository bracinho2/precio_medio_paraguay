import 'car_year_entity.dart';

class CarModelEntity {
  final String name;
  final List<CarYearEntity> years;

  CarModelEntity({
    required this.name,
    required this.years,
  });

  @override
  String toString() => 'CarModelEntity(name: $name, years: $years)';
}
