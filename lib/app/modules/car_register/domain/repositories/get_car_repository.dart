import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../entities/car_entity.dart';

abstract class GetCarRepository {
  Future<Either<Failure, CarEntity>> call({required String carID});
}
