import 'package:flutter/cupertino.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/domain/entities/exchange_entity.dart';

class ExchangeStore {
  final exchanges = ValueNotifier<List<ExchangeEntity>>([]);
}
