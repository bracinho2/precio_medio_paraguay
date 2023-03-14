import 'package:precio_medio_paraguay/app/core/db_dummy/lista_depatamentos_json.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/infra/datasources/get_all_departamentos_datasource.dart';

class GetAllDepartamentosDatasourceImpl implements GetAllDepartamentosDatasource {
  @override
  Future<List<Map<String, dynamic>>> call() async {
    return departamentosParaguayJson;
  }

}