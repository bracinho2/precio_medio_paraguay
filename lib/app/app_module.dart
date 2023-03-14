import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/core/pages/splash_page.dart';
import 'package:precio_medio_paraguay/app/modules/admin/admin_module.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/car_register_module.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/exchange_module.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/regioes_module.dart';

import 'core/core_module.dart';
import 'modules/home_page/home_page_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
    ExchangeModule(),
    CarRegisterModule(),
    RegioesModule(),
    HomePageModule(),
    AdminModule(),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const SplashPage(),
        ),
        ModuleRoute('/exchange/', module: ExchangeModule()),
        ModuleRoute('/car_register/', module: CarRegisterModule()),
        ModuleRoute('/home/', module: HomePageModule()),
        ModuleRoute('/admin/', module: AdminModule()),
      ];
}
