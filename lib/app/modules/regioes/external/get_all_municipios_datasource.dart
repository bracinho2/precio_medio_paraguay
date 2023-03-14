import '../../../core/db_dummy/lista_municipios_com_departamento_json.dart';
import '../infra/datasources/get_all_municipios_datasource.dart';

class GetAllMunicipiosDatasourceImpl implements GetAllMunicipiosDatasource {
  @override
  Future<List<Map<String, dynamic>>> call() async {
    return municipiosComDepartamentosParaguayJson;
  }
}
