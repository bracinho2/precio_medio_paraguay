import 'package:precio_medio_paraguay/app/core/services/local_cache_service/local_cache_service.dart';

class AdminDashBoardController {
  final LocalCacheService _localCacheService;

  AdminDashBoardController(this._localCacheService);

  Future<void> loggout() async {
    await _localCacheService.removeLoggedUserUID();
  }
}
