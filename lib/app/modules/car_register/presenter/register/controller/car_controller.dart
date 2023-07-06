import 'package:flutter/widgets.dart';
import 'package:precio_medio_paraguay/app/core/services/locations/location_service.dart';

import 'package:precio_medio_paraguay/app/modules/authenticator/controller/public_auth_controller.dart';

import 'package:precio_medio_paraguay/app/modules/car_register/domain/usecases/add_car_usecase.dart';

import '../../../domain/entities/car_entity.dart';
import '../../../domain/entities/car_params.dart';
import '../states/car_page_state.dart';



class CarController extends ValueNotifier<CarState> {
  CarController(
      this._publicAuthController, this._addCarUsecase, this._locationService)
      : super(CarRegisterState());

  final PublicAuthController _publicAuthController;
  final AddCarUsecase _addCarUsecase;
  final LocationService _locationService;

  final formKey = GlobalKey<FormState>();

  final params = CarParams.isEmpty();

  void init() async {
    await _getLoggedUser();
    await _getLocation();
  }

  Future<bool> validateForm() async {
    if (formKey.currentState!.validate()) {
      return await _registerCar();
    }
    return false;
  }

  Future<bool> _registerCar() async {
    return await _addCarUsecase.call(
      car: CarEntity.fromParams(params: params),
    );
  }

  void setParams({
    String? manufacturer,
    String? model,
    String? year,
    String? color,
    String? fuel,
    String? gear,
    DateTime? registeredAt,
    DateTime? lastUpdate,
    String? informedBy,
    bool? active,
  }) {
    params.manufacturer = manufacturer ?? params.manufacturer;
    params.model = model ?? params.model;
    params.year = year ?? params.year;
    params.color = color ?? params.color;
    params.fuel = fuel ?? params.fuel;
    params.gear = gear ?? params.gear;
    params.registeredAt = registeredAt ?? params.registeredAt;
    params.lastUpdate = lastUpdate ?? params.lastUpdate;
    params.informedBy = informedBy ?? params.informedBy;
    params.active = active ?? params.active;
  }

  Future<void> _getLoggedUser() async {
    final loggedUserUID = await _publicAuthController.whatUserIsLogged();
    params.informedBy = loggedUserUID!;
  }

  Future<void> _getLocation() async {
    final response = await _locationService.getUserLocation();
    params.coordinates.latitude = response.latitude;
    params.coordinates.longitude = response.longitude;
  }
}
