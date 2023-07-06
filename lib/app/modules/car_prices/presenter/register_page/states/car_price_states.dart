import 'package:precio_medio_paraguay/app/modules/regioes/dominio/entities/departamento_entity.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';

abstract class CarPriceState {}

class CarPriceRegisterState extends CarPriceState {
  final List<CarEntity> cars;
  final List<DepartamentoEntity> departaments;
  CarPriceRegisterState({
    required this.cars,
    required this.departaments,
  });
}

class CarPriceLoadingState extends CarPriceState {}

class CarPriceErrorState extends CarPriceState {
  String message;
  CarPriceErrorState({required this.message});
}
