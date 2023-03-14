import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/core/api_provider/api_provider.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/external/get_all_cars_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/infra/repositories/get_all_cars_repository.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/store/car_register_store.dart';
import 'domain/repositories/get_all_cars_repository.dart';
import 'domain/usecases/get_all_cars_usecase.dart';
import 'infra/datasources/get_all_cars.datasource.dart';

class CarRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<ApiBuilder>(
          (i) => UnoApiProvider(
            Dio(),
          ),
        ),
        Bind.lazySingleton<GetAllCarsDatasource>(
            (i) => GetAllCarsDatasourceImpl(i()),
            export: true),
        Bind.lazySingleton<GetAllCarsRepository>(
            (i) => GetAllCarsRepositoryImpl(i()),
            export: true),
        Bind.lazySingleton<GetAllCarsUsecase>((i) => GetAllCars(i()),
            export: true),
        Bind.singleton((i) => CarRegisterStore(), export: true),
      ];
}
