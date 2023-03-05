import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/modules/home_page/controller/home_page_controller.dart';
import 'package:precio_medio_paraguay/app/modules/home_page/presenter/home_page.dart';

class HomePageModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => HomePageController(i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => HomePage(
            controller: context.read(),
            store: context.read(),
          ),
        ),
      ];
}
