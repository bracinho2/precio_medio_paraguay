import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/core/errors/errors.dart';

import '../entities/municipio_entity.dart';

abstract class GetAllMunicipiosRepository {
  Future<Either<Failure, List<MunicipioEntity>>> call();
}
