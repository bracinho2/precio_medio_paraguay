import 'package:precio_medio_paraguay/app/modules/exchanges/domain/entities/exchange_entity.dart';

import 'package:precio_medio_paraguay/app/core/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/domain/repositories/get_exchange_repository.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/infra/datasource/get_exchange_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/infra/mapper/exchange_mapper.dart';

import '../../domain/errors/errors.dart';

class GetExchangeRepositoryImpl implements GetExchangeRepository {
  final GetExchangeDatasource _getExchangeDatasource;

  GetExchangeRepositoryImpl(this._getExchangeDatasource);
  @override
  Future<Either<Failure, List<ExchangeEntity>>> call() async {
    try {
      final result = await _getExchangeDatasource.call();

      final exchanges = result.map((e) => ExchangeMapper.fromMap(e)).toList();

      return Right(exchanges);
    } on Failure catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(
        ExchangeError(
          message: e.toString(),
          stackTrace: s,
          label: 'Exchange Reposity Error',
        ),
      );
    }
  }
}
