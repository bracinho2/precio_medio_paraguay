import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/repositories/get_all_cars_repository.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/infra/datasources/get_all_cars.datasource.dart';

import '../../../../core/errors/errors.dart';
import '../../domain/entities/car_entity.dart';
import '../../domain/errors/errors.dart';
import '../mapper/car_mapper.dart';

class GetAllCarsRepositoryImpl implements GetAllCarsRepository {
  final GetAllCarsDatasource _getAllCarsDatasource;

  GetAllCarsRepositoryImpl(this._getAllCarsDatasource);
  @override
  Future<Either<Failure, List<CarEntity>>> call() async {
    try {
      final result = await _getAllCarsDatasource.call();

      final values = result.map((e) => CarMapper.fromMap(e)).toList();

      return Right(values);
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
