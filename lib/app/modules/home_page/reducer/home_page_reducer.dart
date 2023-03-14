// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rx_notifier/rx_notifier.dart';

import 'package:precio_medio_paraguay/app/modules/car_register/domain/usecases/get_all_cars_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/home_page/store/home_page_store.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/usecases/get_all_departamentos_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/usecases/get_all_municipios_usecase.dart';

import '../../exchanges/domain/usecases/get_all_exchanges_usecase.dart';

class HomePageReducer extends RxReducer {
  final HomePageStore store;
  final GetAllCarsUsecase _getAllCarsUsecase;

  final GetAllExchangeUsecase _getExchangeUsecase;
  final GetAllDepartamentosUsecase _getAllDepartamentosUsecase;
  final GetAllMunicipiosUsecase _getAllMunicipiosUsecase;

  HomePageReducer(
    this.store,
    this._getAllCarsUsecase,
    this._getExchangeUsecase,
    this._getAllDepartamentosUsecase,
    this._getAllMunicipiosUsecase,
  ) {
    on(() => [store.fetchCars], _fechCars);

    on(() => [store.fetchExchanges], _fetchExchanges);
    on(() => [store.fetchDepartamentos], _fetchDepartamentos);
    on(() => [store.fetchMunicipios], _fetchMunipios);
  }

  void _fechCars() async {
    final response = await _getAllCarsUsecase.call();
    response.fold(
      (error) => null,
      (sucess) {
        store.cars.value = sucess;
      },
    );
  }

  void _fetchExchanges() async {
    final response = await _getExchangeUsecase.call();
    response.fold(
      (l) => null,
      (sucess) {
        store.exchanges.value = sucess;
      },
    );
  }

  void _fetchDepartamentos() async {
    final response = await _getAllDepartamentosUsecase.call();
    response.fold(
      (l) => null,
      (sucess) {
        store.departamentos.value = sucess;
      },
    );
  }

  void _fetchMunipios() async {
    final response = await _getAllMunicipiosUsecase.call();
    response.fold(
      (l) => null,
      (sucess) => {
        store.municipios.value = sucess,
      },
    );
  }
}
