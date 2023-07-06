import 'package:flutter_modular/flutter_modular.dart';

abstract class CarPriceDelegate {
  Future<void> registerPrice({required bool status});
  Future<void> goBack();
}

class CarPricePageFlow implements CarPriceDelegate {
  @override
  Future<void> registerPrice({required bool status}) async {
    if (status) {
      Modular.to.navigate('/user_area/');
    } else if (Modular.to.canPop()) {
      Modular.to.navigate('/price_register/');
    }
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
