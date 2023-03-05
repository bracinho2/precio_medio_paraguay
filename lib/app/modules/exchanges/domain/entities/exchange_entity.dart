class ExchangeEntity {
  final String code;
  final int salePrice;
  final DateTime updateAt;

  ExchangeEntity({
    required this.code,
    required this.salePrice,
    required this.updateAt,
  });

  @override
  String toString() =>
      'ExchangeEntity(code: $code, salePrice: $salePrice, updateAt: $updateAt)';
}
