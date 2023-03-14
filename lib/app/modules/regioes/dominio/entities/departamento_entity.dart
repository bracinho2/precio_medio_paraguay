// ignore_for_file: public_member_api_docs, sort_constructors_first
class DepartamentoEntity {
  final String id;
  final String name;
  final String capital;

  DepartamentoEntity({
    required this.id,
    required this.name,
    required this.capital,
  });

  @override
  String toString() =>
      'DepartamentoEntity(id: $id, name: $name, capital: $capital)';
}
