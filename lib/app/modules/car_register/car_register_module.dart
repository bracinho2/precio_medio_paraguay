import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/usecases/remove_car_usecase.dart';

import 'package:precio_medio_paraguay/app/modules/car_register/domain/usecases/update_car_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/external/firebase_car_datasource_impl.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/infra/datasources/car_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/presenter/list/car_list_page.dart';

import 'domain/repositories/car_repository.dart';
import 'domain/usecases/add_car_usecase.dart';
import 'domain/usecases/get_all_cars_usecase.dart';
import 'infra/repositories/car_repository_impl.dart';
import 'presenter/list/controller/car_list_controller.dart';
import 'presenter/register/controller/car_controller.dart';
import 'presenter/delegate/car_delegate.dart';
import 'presenter/register_car_page.dart';

class CarRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<CarDatasource>((i) => FirebaseCarDatasourceImpl(i()),
            export: true),
        Bind.lazySingleton<CarRepository>((i) => CarRepositoryImpl(i()),
            export: true),
        Bind.lazySingleton<UpdateCarUsecase>((i) => UpdateCar(i()),
            export: true),
        Bind.lazySingleton<UpdateCarUsecase>((i) => UpdateCar(i()),
            export: true),
        Bind.lazySingleton<RemoveCarUsecase>((i) => RemoveCar(i()),
            export: true),
        Bind.lazySingleton<AddCarUsecase>((i) => AddCar(i()), export: true),
        Bind.lazySingleton<GetAllCarsUsecase>((i) => GetAllCars(i()),
            export: true),
        Bind.lazySingleton((i) => CarController(i(), i(), i()), export: true),
        Bind.lazySingleton<CarDelegate>((i) => CarPageFlow()),

        /// List
        Bind.lazySingleton((i) => CarListController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/register/',
          child: (context, args) => RegisterCarPage(
            controller: context.read(),
          ),
        ),
        ChildRoute(
          '/list/',
          child: (context, args) => CarListPage(
            carListController: context.read(),
          ),
        ),
      ];
}
