enum ExchangeType {
  usd(1, 'USD'),
  brl(2, 'BRL');

  final String value;
  final int id;
  const ExchangeType(
    this.id,
    this.value,
  );
}
