import 'package:flutter/material.dart';

import '../../../domain/usecases/get_all_cars_usecase.dart';
import '../states/car_list_states.dart';

class CarListController extends ValueNotifier<CarListState> {
  CarListController(this._getAllCarsUsecase) : super(CarListLoadingState());

  final GetAllCarsUsecase _getAllCarsUsecase;

  void init() {
    _fetchCars();
  }

  void _fetchCars() async {
    final cars = await _getAllCarsUsecase.call();
    value = CarListSuccessState(cars: cars);
  }
}
