

import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/repositories/get_all_departamentos_repository.dart';

import '../../../../core/errors/errors.dart';
import '../entities/departamento_entity.dart';

abstract class GetAllDepartamentosUsecase {
  Future<Either<Failure, List<DepartamentoEntity>>> call();
}

class GetAllDepartamentos implements GetAllDepartamentosUsecase {
  final GetAllDepartamentosRepository _getAllDepartamentosRepository;

  GetAllDepartamentos(this._getAllDepartamentosRepository);
  @override
  Future<Either<Failure, List<DepartamentoEntity>>> call() async {
    return await _getAllDepartamentosRepository.call();
  }
}
