import 'package:precio_medio_paraguay/app/modules/car_register/domain/repositories/car_repository.dart';

import '../../core/typedef/typedef.dart';

abstract class GetCarUsecase {
  Future<GetCarByIdResult> call({required String uid});
}

class GetCar implements GetCarUsecase {
  final CarRepository _repository;

  GetCar(this._repository);
  @override
  Future<GetCarByIdResult> call({required String uid}) async {
    return await _repository.getCarByID(uid: uid);
  }
}
