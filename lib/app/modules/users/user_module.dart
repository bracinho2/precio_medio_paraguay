import 'package:flutter_modular/flutter_modular.dart';

import 'services/repository/user_repository.dart';

class UserModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<UserRepository>((i) => GetAllUsers(i()),
            export: true),
      ];

  @override
  List<ModularRoute> get routes => [];
}
