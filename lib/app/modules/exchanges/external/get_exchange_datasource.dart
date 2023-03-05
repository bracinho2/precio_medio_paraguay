import 'package:precio_medio_paraguay/app/core/api_provider/api_provider.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/infra/datasource/get_exchange_datasource.dart';

import '../../../core/exchanges/exchanges.dart';

class GetExchangeDatasourceImpl implements GetExchangeDatasource {
  final ApiBuilder _api;

  GetExchangeDatasourceImpl(this._api);
  @override
  Future<List<Map<String, dynamic>>> call() async {
    final response = await _api.get(baseUrl: cambiosChacoCotizacionesURL);

    final values = List<Map<String, dynamic>>.from(response.data['items']);

    return values;
  }
}
