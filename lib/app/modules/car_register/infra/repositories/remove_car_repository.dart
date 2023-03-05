import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/repositories/remove_car_repository.dart';

import '../../../../core/errors/errors.dart';
import '../../domain/errors/errors.dart';
import '../datasources/remove_car_datasource.dart';

class RemoveCarRepositoryImpl implements RemoveCarRepository {
  final RemoveCarDatasource _removeCarDatasource;

  RemoveCarRepositoryImpl(this._removeCarDatasource);
  @override
  Future<Either<Failure, Unit>> call({required String carID}) async {
    try {
      final result = await _removeCarDatasource.call(carID: carID);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(
        CarRegisterError(
          message: e.toString(),
          stackTrace: s,
          label: 'CarRegister Reposity Error',
        ),
      );
    }
  }
}
