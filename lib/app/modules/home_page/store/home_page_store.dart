import 'package:precio_medio_paraguay/app/modules/regioes/dominio/entities/departamento_entity.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/entities/municipio_entity.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../car_register/domain/entities/car_entity.dart';
import '../../exchanges/domain/entities/exchange_entity.dart';

class HomePageStore {
  final cars = RxNotifier<List<CarEntity>>([]);
  final exchanges = RxNotifier<List<ExchangeEntity>>([]);
  final departamentos = RxNotifier<List<DepartamentoEntity>>([]);
  final municipios = RxNotifier<List<MunicipioEntity>>([]);

  final exchangeFilterState = RxNotifier<String>('');
  final filterDepartamentoState = RxNotifier<String>('');
  final filterCarWordState = RxNotifier<String>('');

  List<ExchangeEntity> get filteredExchangeState {
    if (exchangeFilterState.value.isEmpty) {
      return exchanges.value;
    }

    return exchanges.value
        .where((element) => element.code
            .toLowerCase()
            .contains(exchangeFilterState.value.toLowerCase()))
        .toList();
  }

  List<DepartamentoEntity> get filteredDepartamentoState {
    if (filterDepartamentoState.value.isEmpty) {
      return departamentos.value;
    }

    return departamentos.value
        .where((element) => element.name
            .toLowerCase()
            .contains(filterDepartamentoState.value.toLowerCase()))
        .toList();
  }

  List<CarEntity> get filteredCarListState {
    if (filterCarWordState.value.isEmpty) {
      return cars.value;
    }

    return cars.value
        .where((element) => element.getName.value
            .toLowerCase()
            .contains(filterCarWordState.value.toLowerCase()))
        .toList();
  }

  final fetchCars = RxAction();
  final fetchOneCarAction = RxNotifier<String>('');
  final fetchExchanges = RxAction();
  final fetchDepartamentos = RxAction();
  final fetchMunicipios = RxAction();
}
