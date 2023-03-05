import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/core/api_provider/api_provider.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/domain/repositories/get_exchange_repository.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/domain/usecases/get_exchange_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/external/get_exchange_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/infra/datasource/get_exchange_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/infra/repository/get_exchange_repository.dart';

import 'package:precio_medio_paraguay/app/modules/exchanges/store/exchange_store.dart';

import 'package:uno/uno.dart';

class ExchangeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<ApiBuilder>((i) => UnoApiProvider(Uno()),
            export: true),
        Bind.lazySingleton<GetExchangeDatasource>(
            (i) => GetExchangeDatasourceImpl(i()),
            export: true),
        Bind.lazySingleton<GetExchangeRepository>(
            (i) => GetExchangeRepositoryImpl(i()),
            export: true),
        Bind.lazySingleton<GetExchangeUsecase>(
            (i) => GetExchangeUsecaseImpl(i()),
            export: true),
        Bind.singleton((i) => ExchangeStore(), export: true),
      ];
}
