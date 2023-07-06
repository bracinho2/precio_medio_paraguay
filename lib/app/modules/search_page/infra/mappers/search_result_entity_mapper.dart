import 'package:precio_medio_paraguay/app/modules/search_page/domain/entities/search_result/search_result_entity.dart';

import 'search_result_price_entity_mapper.dart';

class SearchResultEntityMapper {
  static SearchResultEntity fromMap(Map<String, dynamic> map) {
    return SearchResultEntity(
      uid: map['uid'],
      manufacturer: map['manufacturer'],
      model: map['model'],
      minimum: double.parse(map['minimum']),
      medium: double.parse(map['medium']),
      maximum: double.parse(map['maximum']),
      year: map['year'],
      prices: (map['prices'] as List)
          .map((map) => SearchResultPriceEntityMapper.fromMap(map))
          .toList(),
    );
  }

  static List<SearchResultEntity> fromListMap(List<Map<String, dynamic>> list) {
    return list.map((map) => SearchResultEntityMapper.fromMap(map)).toList();
  }
}
