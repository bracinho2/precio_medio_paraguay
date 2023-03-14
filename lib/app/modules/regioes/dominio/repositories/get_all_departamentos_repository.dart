import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/core/errors/errors.dart';

import '../entities/departamento_entity.dart';

abstract class GetAllDepartamentosRepository {
  Future<Either<Failure, List<DepartamentoEntity>>> call();
}
