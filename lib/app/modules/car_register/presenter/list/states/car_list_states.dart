import '../../../domain/entities/car_entity.dart';

abstract class CarListState {}

class CarListLoadingState extends CarListState {}

class CarListSuccessState extends CarListState {
  final List<CarEntity> cars;
  CarListSuccessState({required this.cars});
}

class CarListErrorState extends CarListState {}
