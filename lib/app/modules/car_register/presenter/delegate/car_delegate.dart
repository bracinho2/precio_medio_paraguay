import 'package:flutter_modular/flutter_modular.dart';

abstract class CarDelegate {
  Future<void> registerCar({required bool status});
  Future<void> carList();
  Future<void> goBack();
}

class CarPageFlow implements CarDelegate {
  @override
  Future<void> registerCar({required bool status}) async {
    if (status) {
      Modular.to.navigate('/user_area/');
    } else if (Modular.to.canPop()) {
      Modular.to.navigate('/car_register/');
    }
  }

  @override
  Future<void> carList() async {
    Modular.to.navigate('/car_register/car_list/');
  }

  @override
  Future<void> goBack() async {
    if (Modular.to.canPop()) {
      Modular.to.pop();
    } else {
      Modular.to.navigate('/user_area/');
    }
  }
}
