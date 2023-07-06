import 'package:precio_medio_paraguay/app/core/services/firestore/remote_storage_service_interface.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/infra/datasources/fetch_search_filter_datasource.dart';

import '../core/firebase_collection_path_enum.dart';

class FetchSearchDatasource implements ISearchDatasource {
  final IRemoteStorage _iRemoteStorage;

  FetchSearchDatasource(this._iRemoteStorage);
  @override
  Future<List<Map<String, dynamic>>> fetchFilters() async {
    final response = await _iRemoteStorage.getAll(
        collectionPath: FirebaseCollectionPathsEnum.searchFilter.path);

    return response;
  }

  @override
  Future<List<Map<String, dynamic>>> fetchSearchResults(
      {required Map<String, dynamic> params}) async {
    final response = await _iRemoteStorage.getSearchResultByFilter(
      collectionPath: FirebaseCollectionPathsEnum.searchResult.path,
      manufacturer: params['manufacturer'],
      model: params['model'],
      year: params['year'],
    );

    return response;
  }
}
