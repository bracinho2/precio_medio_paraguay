import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_params.dart';

abstract class CarState {}

class CarRegisterState extends CarState {}

class CarLoadingState extends CarState {}

class CarConfirmDataState extends CarState {
  final CarParams params;
  CarConfirmDataState(this.params);
}
