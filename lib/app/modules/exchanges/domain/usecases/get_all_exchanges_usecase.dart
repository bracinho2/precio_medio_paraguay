import 'package:precio_medio_paraguay/app/modules/exchanges/domain/repositories/get_exchange_repository.dart';

import '../../core/typedef.dart';

abstract class GetAllExchangeUsecase {
  Future<ExchangeResult> call();
}

class GetAllExchanges implements GetAllExchangeUsecase {
  final GetExchangeRepository _getExchangeRepository;

  GetAllExchanges(this._getExchangeRepository);
  @override
  Future<ExchangeResult> call() async {
    return _getExchangeRepository.call();
  }
}
