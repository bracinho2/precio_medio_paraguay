abstract class IRemoteStorage {
  Future<List<Map<String, dynamic>>> getAll({
    required String collectionPath,
  });

  Future<Map<String, dynamic>?> getByID({
    required String id,
    required String collectionPath,
  });

  Future<List<Map<String, dynamic>>> getSearchResultByFilter({
    required String collectionPath,
    required String manufacturer,
    required String model,
    required String year,
  });

  Future<Map<String, dynamic>> searchResult({
    required String collectionPath,
    required String name,
    required String value,
  });

  Future<bool> addItem({
    required Map<String, dynamic> map,
    required String collectionPath,
  });
  Future<bool> updateItem({
    required Map<String, dynamic> map,
    required String collectionPath,
  });
  Future<bool> removeItem({
    required String uid,
    required String collectionPath,
  });

  Future<Map<String, dynamic>> login({
    required Map<String, dynamic> map,
    required String collectionPath,
  });
}
