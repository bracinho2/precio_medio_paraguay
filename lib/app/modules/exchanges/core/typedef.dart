import 'package:dartz/dartz.dart';

import '../domain/entities/exchange_entity.dart';
import '../domain/errors/errors.dart';

typedef ExchangeResult = Either<ExchangeError, List<ExchangeEntity>>;