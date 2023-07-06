abstract class ISearchDatasource {
  Future<List<Map<String, dynamic>>> fetchFilters();
  Future<List<Map<String, dynamic>>> fetchSearchResults(
      {required Map<String, dynamic> params});
}
