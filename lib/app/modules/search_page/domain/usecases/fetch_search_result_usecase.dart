import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/domain/entities/search_params/search_params_entity.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/domain/errors/errors.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/domain/repositories/search_repository.dart';

import '../entities/search_result/search_result_entity.dart';

abstract class FetchSearchResultUsecase {
  Future<Either<SearchPageError, List<SearchResultEntity>>> fetchSearchResult(
      {required SearchParamsEntity params});
}

class FetchSearchResult implements FetchSearchResultUsecase {
  final ISearchRepository _repository;

  FetchSearchResult(this._repository);
  @override
  Future<Either<SearchPageError, List<SearchResultEntity>>> fetchSearchResult(
      {required SearchParamsEntity params}) async {
    return _repository.fetchSearchResults(params: params);
  }
}
