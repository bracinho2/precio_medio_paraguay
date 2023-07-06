import 'package:flutter_modular/flutter_modular.dart';

abstract class AdminAreaDelegate {
  Future<void> carAndPrices();
  Future<void> goBack();
  Future<void> signIn({required bool status});
  Future<void> signOut();
  Future<void> registerCar();
  Future<void> registerCarSuccess({required bool status});
  Future<void> updateCarSuccess({required bool status});
}

class AdminAreaPageFlow implements AdminAreaDelegate {
  @override
  Future<void> carAndPrices() async {
    Modular.to.pushNamed('/admin_area/car_and_prices/');
  }

  @override
  Future<void> goBack() async {
    if (Modular.to.canPop()) {
      Modular.to.pop();
    } else {
      Modular.to.navigate('/initial/');
    }
  }

  @override
  Future<void> signIn({required bool status}) async {
    if (status) {
      Modular.to.navigate('/admin_area/dashboard/');
    }
  }

  @override
  Future<void> signOut() async {
    Modular.to.navigate('/initial/');
  }

  @override
  Future<void> registerCar() async {
    Modular.to.pushNamed('/admin_area/car_register/');
  }

  @override
  Future<void> registerCarSuccess({required bool status}) async {
    if (status) {
      Modular.to.navigate('/admin_area/car_and_prices/');
    } else if (Modular.to.canPop()) {
      Modular.to.pop();
    } else {
      Modular.to.navigate('/admin_area/car_and_prices/');
    }
  }

  @override
  Future<void> updateCarSuccess({required bool status}) async {
    if (status) {
      if (Modular.to.canPop()) {
        Modular.to.pop();
      }
    }
    Modular.to.navigate('/admin_area/car_and_prices/');
  }
}
