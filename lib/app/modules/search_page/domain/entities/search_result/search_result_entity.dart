import 'search_result_price_entity.dart';

class SearchResultEntity {
  final String? uid;
  final String manufacturer;
  final String model;
  final double minimum;
  final double medium;
  final double maximum;
  final String year;
  final List<SearchResultPriceEntity> prices;

  const SearchResultEntity({
    this.uid,
    required this.manufacturer,
    required this.model,
    required this.minimum,
    required this.medium,
    required this.maximum,
    required this.prices,
    required this.year,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'manufacturer': manufacturer,
      'model': model,
      'minimum': minimum.toString(),
      'medium': medium.toString(),
      'maximum': maximum.toString(),
      'year': year,
      'prices': prices.map((x) => x.toMap()).toList(),
    };
  }

  @override
  String toString() {
    return 'SearchResultEntity(uid: $uid, manufacturer: $manufacturer, model: $model, minimum: $minimum, medium: $medium, maximum: $maximum, year: $year, prices: $prices)';
  }
}
