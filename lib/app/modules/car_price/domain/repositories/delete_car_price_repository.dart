import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';

abstract class DeleteCarPriceRepository {
  Future<Either<Failure, Unit>> call({required String carPriceID});
}
