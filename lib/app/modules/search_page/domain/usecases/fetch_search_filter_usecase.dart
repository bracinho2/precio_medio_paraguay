import 'package:dartz/dartz.dart';

import 'package:precio_medio_paraguay/app/modules/search_page/domain/errors/errors.dart';

import '../entities/search_filter/search_filter_entity.dart';
import '../repositories/search_repository.dart';

abstract class FetchSearchFilterUsecase {
  Future<Either<SearchPageError, SearchFilterEntity>> call();
}

class FetchSearchFilter implements FetchSearchFilterUsecase {
  final ISearchRepository _fetchSearchFilterRepository;

  FetchSearchFilter(this._fetchSearchFilterRepository);
  @override
  Future<Either<SearchPageError, SearchFilterEntity>> call() async {
    return _fetchSearchFilterRepository.fetchFilters();
  }
}
