import 'package:cloud_firestore/cloud_firestore.dart';

import 'remote_storage_service_interface.dart';

class FirebaseRemoteStorage implements IRemoteStorage {
  final FirebaseFirestore _firestore;

  FirebaseRemoteStorage(this._firestore);

  @override
  Future<bool> addItem(
      {required Map<String, dynamic> map,
      required String collectionPath}) async {
    map.remove('uid');
    await _firestore.collection(collectionPath).add(map);

    return true;
  }

  @override
  Future<bool> removeItem(
      {required String uid, required String collectionPath}) async {
    await _firestore.collection(collectionPath).doc(uid).update({
      "active": false,
    });

    return true;
  }

  @override
  Future<bool> updateItem(
      {required Map<String, dynamic> map,
      required String collectionPath}) async {
    final uid = map['uid'];
    map.remove('uid');
    await _firestore.collection(collectionPath).doc(uid).update(map);

    return true;
  }

  @override
  Future<Map<String, dynamic>> getByID(
      {required String id, required String collectionPath}) async {
    final response = await _firestore.collection(collectionPath).doc(id).get();
    final map = {
      'uid': response.reference.id,
      ...?response.data(),
    };

    return map;
  }

  @override
  Future<List<Map<String, dynamic>>> getSearchResultByFilter({
    required String collectionPath,
    required String manufacturer,
    required String model,
    required String year,
  }) async {
    final response = await _firestore
        .collection(collectionPath)
        .where('manufacturer', isEqualTo: manufacturer)
        .where('model', isEqualTo: model)
        .where('year', isEqualTo: year)
        .get();

    final lista = response.docs.map((doc) {
      final map = {
        'uid': doc.reference.id,
        ...doc.data(),
      };

      return map;
    }).toList();

    return lista;
  }

  @override
  Future<Map<String, dynamic>> searchResult(
      {required String collectionPath,
      required String name,
      required String value}) async {
    final response = await _firestore
        .collection(collectionPath)
        .where(name, isEqualTo: value)
        .where('manufacturer', isEqualTo: 'toyota')
        .get();
    final map = {
      'uid': response.docs.first.id,
      ...response.docs.first.data(),
    };

    return map;
  }

  @override
  Future<List<Map<String, dynamic>>> getAll(
      {required String collectionPath}) async {
    final response = await _firestore.collection(collectionPath).get();

    final lista = response.docs.map((doc) {
      final map = {
        'uid': doc.reference.id,
        ...doc.data(),
      };

      return map;
    }).toList();

    return lista;
  }

  @override
  Future<Map<String, dynamic>> login(
      {required Map<String, dynamic> map,
      required String collectionPath}) async {
    final response = await _firestore
        .collection(collectionPath)
        .where('email', isEqualTo: map['email'])
        .where('password', isEqualTo: map['password'])
        .limit(1)
        .get();

    final user = response.docs
        .map((doc) => {
              'uid': doc.reference.id,
              ...doc.data(),
            })
        .first;

    return user;
  }
}
