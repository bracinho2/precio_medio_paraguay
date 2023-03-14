import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/modules/admin/presenter/reducer/admin_reducer.dart';
import 'package:precio_medio_paraguay/app/modules/admin/store/admin_store.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/usecases/get_all_cars_usecase.dart';

import 'presenter/admin_page.dart';

class AdminModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => AdminReducer(i(), i())),
        Bind.singleton((i) => AdminStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => AdminPage(
            store: context.read(),
          ),
        ),
      ];
}
