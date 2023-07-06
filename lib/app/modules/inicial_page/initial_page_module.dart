import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/modules/inicial_page/presenter/delegate/initial_page_delegate.dart';
import 'package:precio_medio_paraguay/app/modules/inicial_page/presenter/pages/inicial_page.dart';

class InitialPageModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<InitialPageDelegate>((i) => InitialPageFlow(i())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const MainPage()),
      ];
}
