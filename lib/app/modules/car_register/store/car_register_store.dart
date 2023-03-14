import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';

class CarRegisterStore {
  final getCarState = ValueNotifier<List<CarEntity>>([]);
}
