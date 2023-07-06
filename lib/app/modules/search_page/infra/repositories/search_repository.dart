import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/infra/mappers/search_params_mapper.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/infra/mappers/search_result_entity_mapper.dart';

import '../../domain/entities/search_filter/search_filter_entity.dart';
import '../../domain/entities/search_params/search_params_entity.dart';
import '../../domain/entities/search_result/search_result_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/search_repository.dart';
import '../../external/fetch_search_filter_datasource_impl.dart';
import '../mappers/search_filter_params_mapper.dart';

class SearchRepository implements ISearchRepository {
  final FetchSearchDatasource _datasource;

  SearchRepository(this._datasource);
  @override
  Future<Either<SearchPageError, SearchFilterEntity>> fetchFilters() async {
    final response = await _datasource.fetchFilters();

    final filters = CarManufacturerEntityMapper.fromListMap(response);

    return Right(SearchFilterEntity(myFilters: filters));
  }

  @override
  Future<Either<SearchPageError, List<SearchResultEntity>>> fetchSearchResults(
      {required SearchParamsEntity params}) async {
    final response = await _datasource.fetchSearchResults(
        params: SearchParamsMapper.toMap(params));

    final values = SearchResultEntityMapper.fromListMap(response);

    return Right(values);
  }
}
