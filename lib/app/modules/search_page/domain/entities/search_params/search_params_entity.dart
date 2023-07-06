class SearchParamsEntity {
  String manufacturer;
  String model;
  String year;
  SearchParamsEntity({
    required this.manufacturer,
    required this.model,
    required this.year,
  });

  factory SearchParamsEntity.isEmpty() {
    return SearchParamsEntity(manufacturer: '', model: '', year: '');
  }

  bool isValid() {
    return manufacturer.isNotEmpty && model.isNotEmpty && year.isNotEmpty;
  }

  @override
  String toString() =>
      'SearchParamsEntity(manufacturer: $manufacturer, model: $model, year: $year)';
}
