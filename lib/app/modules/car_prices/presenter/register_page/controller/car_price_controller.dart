import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_fuel_type_enum.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_gear_enum.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_sale_type_enum.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/entities/car_price_entitity.dart';

import 'package:precio_medio_paraguay/app/modules/car_prices/domain/usecases/add_car_price_usecase.dart';

import 'package:precio_medio_paraguay/app/modules/regioes/dominio/usecases/get_all_departamentos_usecase.dart';

import '../../../../../core/services/locations/location_service.dart';
import '../../../../authenticator/controller/public_auth_controller.dart';
import '../../../../car_register/domain/usecases/get_all_cars_usecase.dart';
import '../params/car_price_params.dart';
import '../states/car_price_states.dart';

class CarPriceController extends ValueNotifier<CarPriceState> {
  CarPriceController(
      this._getAllCarsUsecase,
      this._getAllDepartamentUsecase,
      this._publicAuthController,
      this._iLocationService,
      this._addCarPriceUsecase)
      : super(
          CarPriceLoadingState(),
        );

  final GetAllCarsUsecase _getAllCarsUsecase;
  final GetAllDepartamentUsecase _getAllDepartamentUsecase;
  final PublicAuthController _publicAuthController;
  final ILocationService _iLocationService;
  final AddCarPriceUsecase _addCarPriceUsecase;

  final formKey = GlobalKey<FormState>();

  void init() {
    _fetchData();
    _getLoggedUser();
    _getLocation();
  }

  void setParams({
    String? uid,
    String? car,
    String? departament,
    String? city,
    String? latitude,
    String? longitude,
    String? carSaleType,
    String? price,
    String? year,
    String? color,
    String? fuel,
    String? gear,
    DateTime? registeredAt,
    DateTime? lastUpdate,
    DateTime? expiration,
    String? informedBy,
    bool? active,
  }) {
    _params.uid = uid ?? _params.uid;
    _params.car = car ?? _params.car;
    _params.address.departament = departament ?? _params.address.departament;
    _params.address.city = city ?? _params.address.city;
    _params.coordinates.latitude = latitude ?? _params.coordinates.latitude;
    _params.coordinates.longitude = longitude ?? _params.coordinates.longitude;
    _params.carSaleType = carSaleType ?? _params.carSaleType;
    _params.price = _convertToDouble(price) ?? _params.price;
    _params.year = year ?? _params.year;
    _params.color = color ?? _params.color;

    _params.fuel = fuel ?? _params.color;
    _params.gear = gear ?? _params.gear;
    _params.registeredAt = registeredAt ?? _params.registeredAt;
    _params.lastUpdate = lastUpdate ?? _params.lastUpdate;

    _params.informedBy = informedBy ?? _params.informedBy;
    _params.active = active ?? _params.active;
  }

  Future<bool> registerPrice() async {
    if (formKey.currentState!.validate()) {
      final price = CarPriceEntity(
        car: _params.car,
        address: _params.address,
        coordinates: _params.coordinates,
        carSaleType: CarSaleTypeENUM.fromString(_params.carSaleType),
        price: _params.price,
        year: _params.year,
        color: _params.color,
        fuel: CarFuelTypeENUM.fromString(_params.fuel),
        gear: CarGearTypeENUM.fromString(_params.gear),
        registeredAt: _params.registeredAt,
        informedBy: _params.informedBy,
        active: _params.active,
      );
      return _addCarPriceUsecase.call(price: price);
    }
    return false;
  }

  final _params = CarPriceParams.isEmpty();

  Future<void> _getLoggedUser() async {
    final loggedUserUID = await _publicAuthController.whatUserIsLogged();
    _params.informedBy = loggedUserUID!;
  }

  Future<void> _getLocation() async {
    final response = await _iLocationService.getUserLocation();
    _params.coordinates.latitude = response.latitude;
    _params.coordinates.longitude = response.longitude;
  }

  double? _convertToDouble(String? value) {
    if (value != null) {
      return double.tryParse(
        value.replaceAll('G\$', '').replaceAll('.', '').replaceAll(',', '.'),
      );
    }
    return null;
  }

  Future<void> _fetchData() async {
    final myState = CarPriceRegisterState(departaments: [], cars: []);

    try {
      final cars = await _getAllCarsUsecase.call();
      myState.cars.addAll(cars);
    } catch (e) {
      value = CarPriceErrorState(message: e.toString());
    }

    final departaments = await _getAllDepartamentUsecase.call();

    departaments.fold(
      (error) => value = CarPriceErrorState(message: error.toString()),
      (success) => myState.departaments.addAll(success),
    );
    value = myState;
  }
}
