import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/modules/home_page/presenter/home_page.dart';
import 'package:precio_medio_paraguay/app/modules/home_page/presenter/search_page_result.dart';
import 'package:precio_medio_paraguay/app/modules/home_page/reducer/home_page_reducer.dart';
import 'package:precio_medio_paraguay/app/modules/home_page/store/home_page_store.dart';

class HomePageModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => HomePageReducer(
            i(),
            i(),
            i(),
            i(),
            i(),
            
          ),
        ),
        Bind.singleton(
          (i) => HomePageStore(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => HomePage(
            store: context.read(),
          ),
        ),
        ChildRoute(
          '/result/',
          child: (context, args) => SearchPageResult(
            store: context.read(),
          ),
        ),
      ];
}
