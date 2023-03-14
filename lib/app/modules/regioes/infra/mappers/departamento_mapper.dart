import 'package:precio_medio_paraguay/app/modules/regioes/dominio/entities/departamento_entity.dart';

class DepartamentoMapper {
  static DepartamentoEntity fromMap({required Map<String, dynamic> map}) {
    return DepartamentoEntity(
      id: map['id'],
      name: map['name'],
      capital: map['capital'],
    );
  }
}
