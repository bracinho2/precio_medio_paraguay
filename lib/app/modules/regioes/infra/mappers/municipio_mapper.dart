import 'package:precio_medio_paraguay/app/modules/regioes/dominio/entities/municipio_entity.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/infra/mappers/departamento_mapper.dart';

class MunicipioMapper {
  static MunicipioEntity fromMap({required Map<String, dynamic> map}) {
    return MunicipioEntity(
      id: map['id'],
      name: map['name'],
      departamento: DepartamentoMapper.fromMap(
        map: map['departamento'],
      ),
    );
  }
}
