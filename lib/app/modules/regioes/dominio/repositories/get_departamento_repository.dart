import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/core/errors/errors.dart';

import '../entities/departamento_entity.dart';

abstract class GetDepartamentoRepository {
  Future<Either<Failure, DepartamentoEntity>> call(
      {required String departamentoID});
}
