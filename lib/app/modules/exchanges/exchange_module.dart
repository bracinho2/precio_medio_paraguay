import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/core/services/api_provider/api_provider.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/domain/repositories/get_exchange_repository.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/domain/usecases/get_all_exchanges_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/external/get_exchange_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/infra/datasource/get_exchange_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/infra/repository/get_exchange_repository.dart';

class ExchangeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<ApiBuilder>((i) => UnoApiProvider(Dio()),
            export: true),
        Bind.lazySingleton<GetExchangeDatasource>(
            (i) => GetExchangeDatasourceImpl(i()),
            export: true),
        Bind.lazySingleton<GetExchangeRepository>(
            (i) => GetExchangeRepositoryImpl(i()),
            export: true),
        Bind.lazySingleton<GetAllExchangeUsecase>((i) => GetAllExchanges(i()),
            export: true),
      ];
}
