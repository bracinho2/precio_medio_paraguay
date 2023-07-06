import 'package:precio_medio_paraguay/app/modules/car_prices/domain/entities/car_price_entitity.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/entities/departamento_entity.dart';
import 'package:precio_medio_paraguay/app/modules/users/model/user_entity.dart';

abstract class AdminPageState {}

class AdminPageSuccessState extends AdminPageState {
  final List<CarEntity> cars;
  final List<CarPriceEntity> prices;
  final List<UserEntity> users;
  final List<DepartamentoEntity> departaments;

  AdminPageSuccessState({
    required this.cars,
    required this.prices,
    required this.users,
    required this.departaments,
  });
}

class AdminPageLoadingState extends AdminPageState {}

class AdminPageErrorState extends AdminPageState {}
