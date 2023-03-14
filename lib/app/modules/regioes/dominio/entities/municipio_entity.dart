import 'departamento_entity.dart';

class MunicipioEntity {
  final String id;
  final String name;
  final DepartamentoEntity departamento;

  MunicipioEntity({
    required this.id,
    required this.name,
    required this.departamento,
  });

  @override
  String toString() =>
      'MunicipioEntity(id: $id, departamento: $departamento, name: $name)';
}
