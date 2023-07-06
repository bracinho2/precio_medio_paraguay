import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/modules/admin_area/repository/admin_area_repository.dart';
import 'package:precio_medio_paraguay/app/modules/admin_area/view/dashboard/presenter/cars_and_prices/controller/cars_and_prices_controller.dart';
import 'package:precio_medio_paraguay/app/modules/admin_area/view/dashboard/presenter/cars_and_prices/page/admin_car_register_page.dart';

import 'package:precio_medio_paraguay/app/modules/admin_area/view/dashboard/presenter/menu/admin_dashboard_page.dart';
import 'package:precio_medio_paraguay/app/modules/admin_area/view/dashboard/presenter/menu/controller/admin_dashboard_controller.dart';

import 'view/dashboard/presenter/cars_and_prices/page/admin_cars_and_prices.dart';
import 'view/delegate/admin_area_delegate.dart';
import 'view/login/controller/admin_area_login_controller.dart';
import 'view/login/page/admin_area_login_page.dart';

class AdminAreaModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<CarsAndPricesController>((i) =>
            CarsAndPricesController(
                i(), i(), i(), i(), i(), i(), i(), i(), i(), i(), i(), i())),
        Bind.lazySingleton<AdminAreaDelegate>((i) => AdminAreaPageFlow()),

        /// LOGIN
        Bind.lazySingleton<IAdminAreaRepository>(
            (i) => AdminAreaRepository(i())),
        Bind.lazySingleton((i) => AdminAreaLoginController(i(), i())),

        /// DASHBOARD
        Bind.lazySingleton((i) => AdminDashBoardController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/login/',
          child: (context, args) => AdminAreaLoginPage(
            controller: context.read(),
            delegate: context.read(),
            snackBarManager: context.read(),
          ),
        ),
        ChildRoute(
          '/dashboard/',
          child: (context, args) => AdminDashboardPage(
            controller: context.read(),
            delegate: context.read(),
          ),
        ),
        ChildRoute(
          '/car_and_prices/',
          child: (context, args) => CarsAndPricesPage(
            controller: context.read(),
            delegate: context.read(),
          ),
        ),
        ChildRoute(
          '/car_register/',
          child: (context, args) => AdminCarRegisterPage(
            controller: context.read(),
            delegate: context.read(),
            snackBarManager: context.read(),
          ),
        ),
      ];
}
