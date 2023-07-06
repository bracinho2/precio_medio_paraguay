import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/usecases/get_all_car_prices_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/usecases/get_all_cars_usecase.dart';

import '../states/car_list_states.dart';

class CarListController extends ValueNotifier<CarListState> {
  CarListController(this._getAllCarPrices, this._getAllCars)
      : super(CarListLoadingState());

  final GetAllCarPrices _getAllCarPrices;
  final GetAllCars _getAllCars;

  void init() {
    _fetchPrices();
  }

  Future<void> _fetchPrices() async {
    try {
      final prices = await _getAllCarPrices.call();
      final cars = await _getAllCars.call();
      value = CarListSuccessState(prices: prices, cars: cars);
    } catch (e) {
      value = CarListErrorState(message: e.toString());
    }
  }
}
