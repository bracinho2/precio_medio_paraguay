import 'package:precio_medio_paraguay/app/modules/regioes/dominio/entities/departamento_entity.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/entities/municipio_entity.dart';

class DepartamentoMapper {
  static DepartamentoEntity fromMap({required Map<String, dynamic> map}) {
    return DepartamentoEntity(
      uid: map['id'],
      name: map['name'],
      capital: map['capital'],
      cities: (map['cidades'] as List)
          .map((e) => MunicipioEntityMapper.fromString(e))
          .toList()
        ..sort((a, b) => a.name.compareTo(b.name)),
    );
  }
}

class MunicipioEntityMapper {
  static MunicipioEntity fromString(String value) {
    return MunicipioEntity(name: value);
  }
}
