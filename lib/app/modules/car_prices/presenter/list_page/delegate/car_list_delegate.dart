import 'package:flutter_modular/flutter_modular.dart';

abstract class CarListDelegate {
  void goBack();
}

class CarListPageFlow implements CarListDelegate {
  @override
  void goBack() {
    if (Modular.to.canPop()) {
      Modular.to.pop();
    } else {
      Modular.to.navigate('/user_area/');
    }
  }
}
