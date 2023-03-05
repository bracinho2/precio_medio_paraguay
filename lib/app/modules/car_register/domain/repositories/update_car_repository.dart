import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/core/errors/errors.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';

abstract class UpdateCarRepository {
  Future<Either<Failure, Unit>> call({required CarEntity car});
}
