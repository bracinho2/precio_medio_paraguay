import 'package:precio_medio_paraguay/app/modules/exchanges/domain/entities/exchange_entity.dart';

import '../../domain/errors/errors.dart';

class ExchangeMapper {
  static ExchangeEntity fromMap(Map<String, dynamic> map) {
    try {
      return ExchangeEntity(
        code: map['isoCode'],
        salePrice: map['salePrice'],
        updateAt: DateTime.parse(map['updatedAt']),
      );
    } catch (e) {
      throw ExchangeMapperError();
    }
  }
}
