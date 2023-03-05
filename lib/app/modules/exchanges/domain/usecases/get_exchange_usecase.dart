import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/domain/repositories/get_exchange_repository.dart';

import '../../../../core/errors/errors.dart';
import '../entities/exchange_entity.dart';

abstract class GetExchangeUsecase {
  Future<Either<Failure, List<ExchangeEntity>>> call();
}

class GetExchangeUsecaseImpl implements GetExchangeUsecase {
  final GetExchangeRepository _getExchangeRepository;

  GetExchangeUsecaseImpl(this._getExchangeRepository);
  @override
  Future<Either<Failure, List<ExchangeEntity>>> call() async {
    return _getExchangeRepository.call();
  }
}
