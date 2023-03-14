import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/entities/municipio_entity.dart';

import '../../../../core/errors/errors.dart';

abstract class GetDepartamentoRepository {
  Future<Either<Failure, MunicipioEntity>> call({required String municipioID});
}
