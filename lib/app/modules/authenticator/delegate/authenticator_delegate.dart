import 'package:flutter_modular/flutter_modular.dart';

abstract class AuthenticatorDelegate {
  Future<void> signIn({required bool status});
  Future<void> forgotPassword();
  Future<void> hasLoggedUser({required bool hasLoggedUser});
  Future<void> registerPage();
  Future<void> signUp({required bool status});
  Future<void> updateUser({required bool status});
  Future<void> goBack();
}

class AuthenticatorPageFlow implements AuthenticatorDelegate {
  @override
  Future<void> signIn({required bool status}) async {
    if (status) {
      Modular.to.navigate('/user_area/');
    } else if (Modular.to.canPop()) {
      Modular.to.navigate('/authenticator/login/');
    }
  }

  @override
  Future<void> forgotPassword() async {
    Modular.to.navigate('/forgot_password/');
  }

  @override
  Future<void> hasLoggedUser({required bool hasLoggedUser}) async {
    if (hasLoggedUser) {
      Modular.to.navigate('/user_area/');
    }
  }

  @override
  Future<void> registerPage() async {
    Modular.to.navigate('/register/');
  }

  @override
  Future<void> signUp({required bool status}) async {
    if (status) {
      Modular.to.navigate('/login/');
    }
    Modular.to.navigate('/register/');
  }

  @override
  Future<void> updateUser({required bool status}) async {
    if (status) {
      Modular.to.pushNamed('/user_area/');
    }
  }

  @override
  Future<void> goBack() async {
    if (Modular.to.canPop()) {
      Modular.to.pop();
    }
    Modular.to.navigate('/initial/');
  }
}
