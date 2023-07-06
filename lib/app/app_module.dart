import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/core/pages/splash_page.dart';
import 'package:precio_medio_paraguay/app/modules/admin_area/admin_area_module.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/authenticator_module.dart';

import 'package:precio_medio_paraguay/app/modules/car_prices/car_price_module.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/car_register_module.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/exchange_module.dart';
import 'package:precio_medio_paraguay/app/modules/inicial_page/initial_page_module.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/presenter/pages/search_main_page.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/regioes_module.dart';
import 'package:precio_medio_paraguay/app/modules/users/user_module.dart';

import 'core/core_module.dart';

import 'modules/auth_area/auth_area_module.dart';
import 'modules/search_page/search_page_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
    InitialPageModule(),
    AuthenticatorModule(),
    AuthAreaModule(),
    ExchangeModule(),
    CarRegisterModule(),
    RegioesModule(),
    CarPriceModule(),
    SearchPageModule(),
    CarPriceModule(),
    AdminAreaModule(),
    UserModule(),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ModuleRoute(AppPageRoutes.inicial.name, module: InitialPageModule()),
        ModuleRoute('/authentication/', module: AuthenticatorModule()),
        ModuleRoute('/user_area/', module: AuthAreaModule()),
        ModuleRoute('/car_register/', module: CarRegisterModule()),
        ModuleRoute('/car_price/', module: CarPriceModule()),
        ModuleRoute('/admin_area/', module: AdminAreaModule()),
        ChildRoute('/search/',
            child: (context, args) =>
                SearchMainPage(controller: context.read())),
      ];
}

enum AppPageRoutes {
  inicial(1, '/initial/'),
  authentication(2, '/authentication/'),
  userArea(3, '/user_area/'),
  carRegister(4, '/car_register/'),
  carPrice(5, '/car_price/'),
  adminAreaLogin(6, '/admin_area/login/'),
  carSearchPage(7, '/car_search_page/');

  final String name;
  final int id;

  const AppPageRoutes(
    this.id,
    this.name,
  );
}
