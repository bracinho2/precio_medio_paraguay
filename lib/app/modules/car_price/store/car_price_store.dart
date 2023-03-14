import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/domain/entities/car_price_entitity.dart';

class CarPriceStore {
  final prices = ValueNotifier<List<CarPriceEntity>>([]);
}
