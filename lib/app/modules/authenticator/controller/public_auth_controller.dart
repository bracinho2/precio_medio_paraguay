import 'package:precio_medio_paraguay/app/core/services/local_cache_service/local_cache_service.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/presenter/auth_login_page/presenter/controller/auth_login_controller.dart';

import '../core/typedef/typedef.dart';

class PublicAuthController {
  final AuthLoginController _loginController;
  final LocalCacheService _localCacheService;

  PublicAuthController(
    this._loginController,
    this._localCacheService,
  );
  Future<HasLoggedUserResult> hasLoggedUser() async {
    return _loginController.hasLoggedUser();
  }

  Future<LoggedUserResult?> whatUserIsLogged() async {
    return await _localCacheService.loadLoggedUserUID();
  }

  Future<LogoutResult> logout() async {
    return _loginController.logout();
  }
}
