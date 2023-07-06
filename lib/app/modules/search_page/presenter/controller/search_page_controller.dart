import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/core/fakes/search_filter_fake.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/core/firebase_collection_path_enum.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/domain/entities/search_params/search_params_entity.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/domain/usecases/fetch_search_filter_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/domain/usecases/fetch_search_result_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/presenter/states/search_page_state.dart';

import '../../../exchanges/domain/entities/exchange_entity.dart';

import '../../core/fakes/fake_search_result_entity.dart';

class SearchPageController extends ValueNotifier<SearchPageState> {
  SearchPageController(this._fetchSearchFilter, this._fetchSearchResultUsecase,
   )
      : super(SearchPageLoadingState());
  final FetchSearchFilter _fetchSearchFilter;
  final FetchSearchResultUsecase _fetchSearchResultUsecase;
  

  final formKey = GlobalKey<FormState>();
  final params = SearchParamsEntity.isEmpty();

  void searchAgain() {
    fetchFilters();
  }

  void fetchDolarExchange({required List<ExchangeEntity> exchanges}) {
    //final dolar = exchanges.where((element) => element.code.contains('USD'));
  }

  Future<void> fetchExchangeNow() async {
    //final response = await _getAllExchangeUsecase.call();
  }

  void fetchSearchResult() async {
    value = SearchPageLoadingState();
    final result =
        await _fetchSearchResultUsecase.fetchSearchResult(params: params);
    result.fold(
      (error) {
        value = SearchPageErrorState(errorMessage: error.toString());
      },
      (success) {
        if (success.isEmpty) {
          value = SearchPageErrorState(errorMessage: 'Nenhum encontrado');
        } else {
          value = SearchPageSucessState(result: success.first);
        }
      },
    );
  }

  void fetchFilters() async {
    final result = await _fetchSearchFilter.call();
    result.fold(
      (error) => value = SearchPageErrorState(errorMessage: error.toString()),
      (success) {
        return value = SearchPageFilterResult(filters: success);
      },
    );
  }

  void setParams({
    String? manufacturer,
    String? model,
    String? year,
  }) {
    params.manufacturer = manufacturer ?? params.manufacturer;
    params.model = model ?? params.model;
    params.year = year ?? params.year;
  }

  void searchValidate() {
    if (formKey.currentState!.validate()) {
      if (params.isValid()) value = SearchPageLoadingState();
    }
    fetchSearchResult();
  }

  Future<void> addSearchFilter() async {
    FirebaseFirestore firebase = FirebaseFirestore.instance;
    await firebase
        .collection(FirebaseCollectionPathsEnum.searchFilter.path)
        .add(fakeSeachFilter);
  }

  Future<void> addSearchResult() async {
    FirebaseFirestore firebase = FirebaseFirestore.instance;
    await firebase
        .collection(FirebaseCollectionPathsEnum.searchResult.path)
        .add(fakeSearchResulEntity.toMap());
  }
}
