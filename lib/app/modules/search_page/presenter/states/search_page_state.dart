import '../../domain/entities/search_filter/search_filter_entity.dart';
import '../../domain/entities/search_result/search_result_entity.dart';

abstract class SearchPageState {}

class SearchPageFilterResult extends SearchPageState {
  final SearchFilterEntity filters;

  SearchPageFilterResult({
    required this.filters,
  });
}

class SearchPageErrorState extends SearchPageState {
  final String errorMessage;

  SearchPageErrorState({
    required this.errorMessage,
  });
}

class SearchPageLoadingState extends SearchPageState {}

class SearchPageSucessState extends SearchPageState {
  final SearchResultEntity result;
  SearchPageSucessState({
    required this.result,
  });
}
