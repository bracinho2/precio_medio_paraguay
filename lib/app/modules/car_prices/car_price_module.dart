import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/repositories/car_price_repository.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/usecases/add_car_price_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/usecases/get_all_car_prices_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/usecases/remove_car_price_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/external/firebase_car_price_datasource_impl.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/infra/datasource/car_price_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/infra/repositories/car_price_repository_impl.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/presenter/list_page/delegate/car_list_delegate.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/presenter/register_page/car_price_register_page.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/presenter/list_page/controller/car_list_controller.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/presenter/register_page/controller/car_price_controller.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/presenter/register_page/delegate/car_price_delegate.dart';

import 'domain/usecases/update_car_price_usecase.dart';
import 'presenter/list_page/car_price_list_page.dart';

class CarPriceModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<CarPriceDatasource>(
            (i) => CarPriceDatasourceImpl(i()),
            export: true),
        Bind.lazySingleton<CarPriceRepository>(
            (i) => CarPriceRepositoryImpl(i()),
            export: true),

        Bind.lazySingleton<RemoveCarPriceUsecase>((i) => RemoveCarPrice(i()),
            export: true),
        Bind.lazySingleton<UpdateCarPriceUsecase>((i) => UpdateCarPrice(i()),
            export: true),
        Bind.lazySingleton<AddCarPriceUsecase>((i) => AddCarPrice(i()),
            export: true),
        Bind.lazySingleton((i) => CarPriceController(i(), i(), i(), i(), i())),
        Bind.lazySingleton<CarPriceDelegate>((i) => CarPricePageFlow()),

        ///List
        Bind.lazySingleton<GetAllCarsPricesUsecase>((i) => GetAllCarPrices(i()),
            export: true),
        Bind.lazySingleton<CarListController>(
            (i) => CarListController(i(), i())),

        Bind.lazySingleton<CarListDelegate>((i) => CarListPageFlow()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/register/',
          child: (context, args) => CarPricePage(
            carPriceController: context.read(),
          ),
        ),
        ChildRoute(
          '/list/',
          child: (context, args) => CarPriceListPage(
            carListController: context.read(),
          ),
        ),
      ];
}
