import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/repositories/update_car_repository.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/infra/datasources/update_car_datasource.dart';

import '../../../../core/errors/errors.dart';
import '../../domain/entities/car_entity.dart';
import '../../domain/errors/errors.dart';
import '../mapper/car_mapper.dart';

class UpdateCarRepositoryImpl implements UpdateCarRepository {
  final UpdateCarDatasource _updateCarDatasource;

  UpdateCarRepositoryImpl(this._updateCarDatasource);
  @override
  Future<Either<Failure, Unit>> call({required CarEntity car}) async {
    try {
      final value = CarMapper.toMap(car: car);
      await _updateCarDatasource.call(car: value);
      return const Right(unit);
    } catch (e, s) {
      return Left(
        CarRegisterError(
          message: e.toString(),
          stackTrace: s,
          label: 'Update Car Reposity Error',
        ),
      );
    }
  }
}
