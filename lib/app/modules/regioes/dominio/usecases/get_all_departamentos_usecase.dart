import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/repositories/get_all_departamentos_repository.dart';

import '../entities/departamento_entity.dart';
import '../errors/errors.dart';

abstract class GetAllDepartamentUsecase {
  Future<Either<RegionError, List<DepartamentoEntity>>> call();
}

class GetAllDepartamentos implements GetAllDepartamentUsecase {
  final GetAllDepartamentosRepository _getAllDepartamentosRepository;

  GetAllDepartamentos(this._getAllDepartamentosRepository);
  @override
  Future<Either<RegionError, List<DepartamentoEntity>>> call() async {
    return await _getAllDepartamentosRepository.call();
  }
}
