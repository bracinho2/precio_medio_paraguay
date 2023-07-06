import 'package:dartz/dartz.dart';

import 'package:precio_medio_paraguay/app/modules/search_page/domain/entities/search_params/search_params_entity.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/domain/errors/errors.dart';

import '../entities/search_filter/search_filter_entity.dart';
import '../entities/search_result/search_result_entity.dart';

abstract class ISearchRepository {
  Future<Either<SearchPageError, SearchFilterEntity>> fetchFilters();
  Future<Either<SearchPageError, List<SearchResultEntity>>> fetchSearchResults({
    required SearchParamsEntity params,
  });
}
