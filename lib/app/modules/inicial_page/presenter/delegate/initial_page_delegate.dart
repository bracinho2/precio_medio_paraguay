import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/core/services/local_cache_service/local_cache_service.dart';

import '../../../../app_module.dart';

abstract class InitialPageDelegate {
  Future<void> goToUserAreaIfHasntLoggedUser();
  Future<void> searchVehicles();
  Future<void> goToAdminAreaLogin();
}

class InitialPageFlow implements InitialPageDelegate {
  final LocalCacheService _authCacheController;

  InitialPageFlow(this._authCacheController);
  @override
  Future<void> goToUserAreaIfHasntLoggedUser() async {
    final result = await _authCacheController.hasLoggedUser();

    if (result) {
      Modular.to.pushNamed('/user_area/');
    } else {
      Modular.to.pushNamed('/authentication/login/');
    }
  }

  @override
  Future<void> searchVehicles() async {
    Modular.to.pushNamed('/search/');
  }

  @override
  Future<void> goToAdminAreaLogin() async {
    Modular.to.navigate(AppPageRoutes.adminAreaLogin.name);
  }
}
