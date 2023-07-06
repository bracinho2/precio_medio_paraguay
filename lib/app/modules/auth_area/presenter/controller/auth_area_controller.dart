import '../../../../core/services/local_cache_service/local_cache_service.dart';

class AuthAreaController {
  final LocalCacheService _localCacheService;

  AuthAreaController(this._localCacheService);
  Future<bool> logout() async {
    return await _localCacheService.removeLoggedUserUID();
  }
}
