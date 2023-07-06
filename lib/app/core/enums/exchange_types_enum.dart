enum ExchangeTypeENUM {
  usd(1, 'USD'),
  brl(2, 'BRL');

  final String value;
  final int id;
  const ExchangeTypeENUM(
    this.id,
    this.value,
  );
}
