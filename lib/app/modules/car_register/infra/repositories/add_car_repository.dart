import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';
import 'package:precio_medio_paraguay/app/core/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/repositories/add_car_repository.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/infra/datasources/add_car_datasource.dart';

import '../../domain/errors/errors.dart';
import '../mapper/car_mapper.dart';

class AddCarRepositoryImpl implements AddCarRepository {
  final AddCarDatasource _addCarDatasource;

  AddCarRepositoryImpl(this._addCarDatasource);
  @override
  Future<Either<Failure, Unit>> call({required CarEntity car}) async {
    try {
      final value = CarMapper.toMap(car: car);
      await _addCarDatasource.call(car: value);
      return const Right(unit);
    } catch (e, s) {
      return Left(
        CarRegisterError(
          message: e.toString(),
          stackTrace: s,
          label: 'Add Car Register Reposity Error',
        ),
      );
    }
  }
}
