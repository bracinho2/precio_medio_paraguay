import 'package:precio_medio_paraguay/app/modules/car_register/core/typedef/typedef.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/repositories/car_repository.dart';

abstract class RemoveCarUsecase {
  Future<RemoveResult> call({required String uid});
}

class RemoveCar implements RemoveCarUsecase {
  final CarRepository _carRepository;

  RemoveCar(this._carRepository);
  @override
  Future<RemoveResult> call({required String uid}) async {
    return await _carRepository.removeCar(uid: uid);
  }
}
