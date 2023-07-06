import 'package:precio_medio_paraguay/app/modules/regioes/infra/datasources/get_all_departamentos_datasource.dart';

import '../../../core/services/firestore/remote_storage_service_interface.dart';

class GetAllDepartamentosDatasourceImpl
    implements GetAllDepartamentosDatasource {
  final IRemoteStorage _iRemoteStorage;

  GetAllDepartamentosDatasourceImpl(this._iRemoteStorage);
  @override
  Future<List<Map<String, dynamic>>> call() async {
    return await _iRemoteStorage.getAll(collectionPath: 'departamentos');
  }
}
