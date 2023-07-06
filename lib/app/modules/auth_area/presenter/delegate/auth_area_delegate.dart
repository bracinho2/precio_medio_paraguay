import 'package:flutter_modular/flutter_modular.dart';

abstract class AuthAreaDelegate {
  Future<void> goToUpdateUser();
  Future<void> goToSearchPage();
  Future<void> logout({required bool status});
  Future<void> registerCar();
  Future<void> initial();
  Future<void> registerPrice();
  Future<void> priceList();
  Future<void> carList();
}

class AuthAreaFlow implements AuthAreaDelegate {
  AuthAreaFlow();
  @override
  Future<void> goToUpdateUser() async {
    Modular.to.pushNamed(
      '/authentication/register/',
    );
  }

  @override
  Future<void> goToSearchPage() async {
    Modular.to.navigate(
      '/initial/',
    );
  }

  @override
  Future<void> logout({required bool status}) async {
    if (status) {
      Modular.to.navigate('/');
    }
  }

  @override
  Future<void> registerCar() async {
    Modular.to.navigate('/car_register/register/');
  }

  @override
  Future<void> initial() async {
    Modular.to.navigate('/user_area/');
  }

  @override
  Future<void> registerPrice() async {
    Modular.to.navigate('/car_price/register/');
  }

  @override
  Future<void> priceList() async {
    Modular.to.pushNamed('/car_price/list/');
  }

  @override
  Future<void> carList() async {
    Modular.to.pushNamed('/car_register/list/');
  }
}
