import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/core/errors/errors.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/domain/entities/exchange_entity.dart';

abstract class GetExchangeRepository {
  Future<Either<Failure, List<ExchangeEntity>>> call();
}
