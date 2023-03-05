import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';

abstract class RemoveCarRepository {
  Future<Either<Failure, Unit>> call({
    required String carID,
  });
}
