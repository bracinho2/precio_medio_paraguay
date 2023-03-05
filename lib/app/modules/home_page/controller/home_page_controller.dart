import 'package:precio_medio_paraguay/app/modules/exchanges/store/exchange_store.dart';

import '../../../core/enums/exchange_types.dart';

import '../../exchanges/domain/usecases/get_exchange_usecase.dart';

class HomePageController {
  final ExchangeStore store;
  final GetExchangeUsecase _usecase;

  HomePageController(this.store, this._usecase);

  void getExchange() async {
    final response = await _usecase.call();
    response.fold(
      (l) => null,
      (sucess) {
        final list =
            sucess.where((element) => element.code == ExchangeType.usd.value);
        print(list);

        store.exchanges.value = sucess;
      },
    );
  }
}
