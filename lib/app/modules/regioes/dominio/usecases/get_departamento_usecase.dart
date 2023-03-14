import '../entities/departamento_entity.dart';

abstract class GetDepartamentoUsecase {
  DepartamentoEntity call(
      {required String departamentoID,
      required List<DepartamentoEntity> departamentos});
}

class GetDepartamento implements GetDepartamentoUsecase {
  @override
  DepartamentoEntity call(
      {required String departamentoID,
      required List<DepartamentoEntity> departamentos}) {
    final departamento = departamentos
        .firstWhere((departamento) => departamento.id == departamentoID);
    return departamento;
  }
}
