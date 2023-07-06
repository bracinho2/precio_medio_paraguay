import '../../core/typedef.dart';

abstract class GetExchangeRepository {
  Future<ExchangeResult> call();
}
