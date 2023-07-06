import '../../domain/entities/search_params/search_params_entity.dart';

class SearchParamsMapper {
  static Map<String, dynamic> toMap(SearchParamsEntity params) {
    return {
      'manufacturer': params.manufacturer,
      'model': params.model,
      'year': params.year,
    };
  }
}
