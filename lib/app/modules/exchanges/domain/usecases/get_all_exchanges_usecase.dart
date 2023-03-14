import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/domain/repositories/get_exchange_repository.dart';

import '../../../../core/errors/errors.dart';
import '../entities/exchange_entity.dart';

abstract class GetAllExchangeUsecase {
  Future<Either<Failure, List<ExchangeEntity>>> call();
}

class GetAllExchangeUsecaseImpl implements GetAllExchangeUsecase {
  final GetExchangeRepository _getExchangeRepository;

  GetAllExchangeUsecaseImpl(this._getExchangeRepository);
  @override
  Future<Either<Failure, List<ExchangeEntity>>> call() async {
    return _getExchangeRepository.call();
  }
}
