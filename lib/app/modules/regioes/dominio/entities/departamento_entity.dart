import 'package:precio_medio_paraguay/app/modules/regioes/dominio/entities/municipio_entity.dart';

class DepartamentoEntity {
  DepartamentoEntity({
    this.uid,
    required this.name,
    required this.capital,
    required this.cities,
  });

  final String? uid;
  final String name;
  final String capital;
  final List<MunicipioEntity> cities;

  @override
  String toString() {
    return 'DepartamentoEntity(uid: $uid, name: $name, capital: $capital, cities: $cities)';
  }
}
