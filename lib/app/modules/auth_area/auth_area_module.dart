import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/modules/auth_area/presenter/controller/auth_area_controller.dart';

import 'presenter/auth_area_page.dart';
import 'presenter/delegate/auth_area_delegate.dart';

class AuthAreaModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<AuthAreaDelegate>((i) => AuthAreaFlow(),
            export: true),
        Bind.lazySingleton((i) => AuthAreaController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const AuthAreaPage(),
        ),
      ];
}
