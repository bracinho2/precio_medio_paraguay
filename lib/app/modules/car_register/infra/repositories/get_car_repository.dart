import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/errors/errors.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/repositories/get_car_repository.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/infra/datasources/get_car_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/infra/mapper/car_mapper.dart';

import '../../../../core/errors/errors.dart';

class GetCarRepositoryImpl implements GetCarRepository {
  final GetCarDatasource _getCarDatasource;

  GetCarRepositoryImpl(this._getCarDatasource);
  @override
  Future<Either<Failure, CarEntity>> call({required String carID}) async {
    try {
      final result = await _getCarDatasource.call(carID: carID);

      final car = CarMapper.fromMap(result);

      return Right(car);
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
