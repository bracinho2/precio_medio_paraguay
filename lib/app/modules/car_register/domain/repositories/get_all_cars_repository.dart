import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';

import '../../../../core/errors/errors.dart';

abstract class GetAllCarsRepository {
  Future<Either<Failure, List<CarEntity>>> call();
}
