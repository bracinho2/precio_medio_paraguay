import 'package:precio_medio_paraguay/app/modules/car_prices/domain/entities/car_price_entitity.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';

abstract class CarListState {}

class CarListLoadingState extends CarListState {}

class CarListSuccessState extends CarListState {
  final List<CarPriceEntity> prices;
  final List<CarEntity> cars;
  CarListSuccessState({required this.prices, required this.cars});
}

class CarListErrorState extends CarListState {
  final String message;
  CarListErrorState({required this.message});
}
