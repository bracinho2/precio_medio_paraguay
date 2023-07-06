import 'package:dartz/dartz.dart';

import '../entities/departamento_entity.dart';
import '../errors/errors.dart';

abstract class GetAllDepartamentosRepository {
  Future<Either<RegionError, List<DepartamentoEntity>>> call();
}
