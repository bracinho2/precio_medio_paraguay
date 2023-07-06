import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/core/common/coordinates.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_fuel_type_enum.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_gear_enum.dart';
import 'package:precio_medio_paraguay/app/core/extensions/string_to_numbers_on_string.dart';
import 'package:precio_medio_paraguay/app/core/services/locations/location_service.dart';
import 'package:precio_medio_paraguay/app/modules/admin_area/view/states/admin_area_page_states.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/controller/public_auth_controller.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/entities/car_price_entitity.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/usecases/add_car_price_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/usecases/get_all_car_prices_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/usecases/update_car_price_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/usecases/add_car_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/usecases/get_all_cars_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/usecases/remove_car_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/usecases/update_car_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/usecases/get_all_departamentos_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/users/services/repository/user_repository.dart';

import '../../../../../../../core/enums/car_sale_type_enum.dart';
import '../../../../../../car_prices/domain/usecases/remove_car_price_usecase.dart';
import '../../../../params/admin_car_params.dart';
import '../../../../params/admin_car_price_params.dart';

class CarsAndPricesController extends ValueNotifier<AdminPageState> {
  CarsAndPricesController(
    this._getAllCarsUsecase,
    this._getAllCarsPricesUsecase,
    this._userRepository,
    this._addCarUsecase,
    this._publicAuthController,
    this._locationService,
    this._removeCarUsecase,
    this._updateCarUsecase,
    this._getAllDepartamentUsecase,
    this._addCarPriceUsecase,
    this._updateCarPriceUsecase,
    this._removeCarPriceUsecase,
  ) : super(AdminPageLoadingState());

  final GetAllCarsUsecase _getAllCarsUsecase;
  final GetAllCarsPricesUsecase _getAllCarsPricesUsecase;
  final UserRepository _userRepository;
  final AddCarUsecase _addCarUsecase;
  final PublicAuthController _publicAuthController;
  final LocationService _locationService;
  final RemoveCarUsecase _removeCarUsecase;
  final UpdateCarUsecase _updateCarUsecase;
  final GetAllDepartamentUsecase _getAllDepartamentUsecase;
  final AddCarPriceUsecase _addCarPriceUsecase;
  final UpdateCarPriceUsecase _updateCarPriceUsecase;
  final RemoveCarPriceUsecase _removeCarPriceUsecase;

  final formKey = GlobalKey<FormState>();
  final _carParams = CarParams.isEmpty();
  final _priceParams = AdminCarPriceParams.isEmpty();

  void init() async {
    await _getData();
    await _getLoggedUser();
    await _getLocation();
  }

  void setPriceParams({
    String? uid,
    String? car,
    String? departament,
    String? city,
    String? carSaleType,
    String? price,
    String? year,
    String? color,
    String? carFuelType,
    String? carGearType,
    DateTime? registeredAt,
    DateTime? lastUpdate,
    DateTime? expiration,
    String? informedBy,
    bool? active,
  }) {
    _priceParams.uid = uid ?? _priceParams.uid;
    _priceParams.car = car ?? '';
    _priceParams.address.departament =
        departament ?? _priceParams.address.departament;
    _priceParams.address.city = city ?? _priceParams.address.city;
    _priceParams.carSaleType = carSaleType ?? '';
    _priceParams.price = _convertToDouble(price) ?? _priceParams.price;
    _priceParams.year = year ?? '';
    _priceParams.color = color ?? '';
    _priceParams.carFuelType = carFuelType ?? '';
    _priceParams.carGearType = carGearType ?? '';
    _priceParams.registeredAt = registeredAt ?? _priceParams.registeredAt;
    _priceParams.lastUpdate = lastUpdate ?? _priceParams.lastUpdate;
    _priceParams.informedBy = informedBy ?? _priceParams.informedBy;
    _priceParams.active = active ?? _priceParams.active;
  }

  double? _convertToDouble(String? value) {
    if (value != null) {
      final teste = double.tryParse(
          value.trim().replaceAll('.', '').replaceAll(',', '.'));

      return teste;
    }
    return null;
  }

  Future<void> removeCarPrice({required String uid}) async {
    try {
      await _removeCarPriceUsecase.call(uid: uid);
      _getData();
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
    }
  }

  Future<bool> updateCarPrice() async {
    if (formKey.currentState!.validate()) {
      final price = CarPriceEntity(
        uid: _priceParams.uid,
        car: _priceParams.car,
        address: _priceParams.address,
        coordinates: _priceParams.coordinates,
        carSaleType: CarSaleTypeENUM.fromString(_priceParams.carSaleType),
        price: _priceParams.price,
        year: _priceParams.year.removeNonNumericCharacters(),
        color: _priceParams.color.removeNumericCharacteres(),
        fuel: CarFuelTypeENUM.fromString(_priceParams.carFuelType),
        gear: CarGearTypeENUM.fromString(_priceParams.carGearType),
        registeredAt: _priceParams.registeredAt,
        lastUpdate: _priceParams.lastUpdate,
        informedBy: _priceParams.informedBy,
        active: _priceParams.active,
      );
      return await _updateCarPriceUsecase.call(price: price).then((value) {
        _getData();
        return value;
      });
    }

    return false;
  }

  Future<bool> registerCarPrice() async {
    if (formKey.currentState!.validate()) {
      final price = CarPriceEntity(
        car: _priceParams.car,
        address: _priceParams.address,
        coordinates: _priceParams.coordinates,
        carSaleType: CarSaleTypeENUM.fromString(_priceParams.carSaleType),
        price: _priceParams.price,
        year: _priceParams.year.removeNonNumericCharacters(),
        color: _priceParams.color.removeNumericCharacteres(),
        fuel: CarFuelTypeENUM.fromString(_priceParams.carFuelType),
        gear: CarGearTypeENUM.fromString(_priceParams.carGearType),
        registeredAt: _priceParams.registeredAt,
        lastUpdate: _priceParams.lastUpdate,
        informedBy: _priceParams.informedBy,
        active: _priceParams.active,
      );
      return await _addCarPriceUsecase(price: price);
    }
    return false;
  }

  void setCarParams({
    String? uid,
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
    _carParams.uid = uid ?? _carParams.uid;
    _carParams.manufacturer = manufacturer ?? _carParams.manufacturer;
    _carParams.model = model ?? _carParams.model;
    _carParams.year = year ?? _carParams.year;
    _carParams.color = color ?? _carParams.color;
    _carParams.fuel = fuel ?? _carParams.fuel;
    _carParams.gear = gear ?? _carParams.gear;
    _carParams.registeredAt = registeredAt ?? _carParams.registeredAt;
    _carParams.lastUpdate = lastUpdate ?? _carParams.lastUpdate;
    _carParams.informedBy = informedBy ?? _carParams.informedBy;
    _carParams.active = active ?? _carParams.active;
  }

  Future<bool> updateCar() async {
    if (formKey.currentState!.validate()) {
      final car = CarEntity(
        uid: _carParams.uid,
        manufacturer: _carParams.manufacturer.toLowerCase(),
        model: _carParams.model.toLowerCase(),
        year: _carParams.year.toLowerCase().removeNonNumericCharacters(),
        fuel: _carParams.fuel,
        gear: _carParams.gear,
        color: _carParams.color.toLowerCase().removeNumericCharacteres(),
        coordinates: Coordinates(
          latitude: _carParams.coordinates.latitude,
          longitude: _carParams.coordinates.longitude,
        ),
        registeredAt: _carParams.registeredAt,
        informedBy: _carParams.informedBy,
        lastUpdate: DateTime.now(),
        active: _carParams.active,
      );

      return await _updateCarUsecase
          .call(
        car: car,
      )
          .then((value) {
        _getData();
        return value;
      });
    }
    return false;
  }

  Future<void> removeCar({required String uid}) async {
    try {
      await _removeCarUsecase.call(uid: uid);
      _getData();
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
    }
  }

  Future<bool> registerCar() async {
    await _getLoggedUser();
    if (formKey.currentState!.validate()) {
      return await _addCarUsecase
          .call(
        car: CarEntity(
          manufacturer: _carParams.manufacturer.toLowerCase(),
          model: _carParams.model.toLowerCase(),
          year: _carParams.year.toLowerCase().removeNonNumericCharacters(),
          fuel: _carParams.fuel,
          gear: _carParams.gear,
          color: _carParams.color.toLowerCase(),
          coordinates: Coordinates(
            latitude: _carParams.coordinates.latitude,
            longitude: _carParams.coordinates.longitude,
          ),
          registeredAt: _carParams.registeredAt,
          informedBy: _carParams.informedBy,
          active: _carParams.active,
        ),
      )
          .then((value) {
        _getData();
        return value;
      });
    }
    return false;
  }

  Future<void> _getLoggedUser() async {
    final loggedUserUID = await _publicAuthController.whatUserIsLogged();

    _carParams.informedBy = loggedUserUID!;
    _priceParams.informedBy = loggedUserUID;
  }

  Future<void> _getLocation() async {
    final response = await _locationService.getUserLocation();
    _carParams.coordinates.latitude = response.latitude;
    _carParams.coordinates.longitude = response.longitude;

    _priceParams.coordinates.latitude = response.latitude;
    _priceParams.coordinates.longitude = response.longitude;
  }

  Future<void> _getData() async {
    final cars = await _getAllCarsUsecase.call();
    final prices = await _getAllCarsPricesUsecase.call();
    final users = await _userRepository.getAll();
    final departaments = await _getAllDepartamentUsecase.call();

    departaments.fold(
      (error) => null,
      (departaments) => value = AdminPageSuccessState(
        cars: cars
          ..sort((a, b) => a.manufacturer.compareTo(b.manufacturer))
          ..sort((a, b) => a.model.compareTo(b.model)),
        prices: prices,
        users: users,
        departaments: departaments,
      ),
    );
  }
}
