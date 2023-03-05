import 'package:dartz/dartz.dart';

abstract class RemoveCarDatasource {
  Future<Unit> call({
    required String carID,
  });
}
