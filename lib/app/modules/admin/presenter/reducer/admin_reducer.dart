import 'package:precio_medio_paraguay/app/modules/admin/store/admin_store.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../car_register/domain/usecases/get_all_cars_usecase.dart';

class AdminReducer extends RxReducer {
  final AdminStore store;
  final GetAllCarsUsecase _getAllCarsUsecase;

  AdminReducer(
    this.store,
    this._getAllCarsUsecase,
  ) {
    on(() => [store.getAllCarsAction], _getAllCars);
  }

  void _getAllCars() async {
    final response = await _getAllCarsUsecase.call();
    response.fold(
      (error) => null,
      (sucess) {
        store.carListState.value = sucess;
      },
    );
  }
}
