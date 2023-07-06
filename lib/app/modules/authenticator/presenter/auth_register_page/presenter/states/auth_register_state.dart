import 'package:precio_medio_paraguay/app/modules/users/model/user_entity.dart';

import '../../../../../regioes/dominio/entities/departamento_entity.dart';

abstract class AuthenticatorState {}

class AuthRegisterState implements AuthenticatorState {
  final List<DepartamentoEntity> departaments;

  const AuthRegisterState({required this.departaments});
}

class AuthUpdateState implements AuthenticatorState {
  final List<DepartamentoEntity> departaments;
  final UserEntity? loggedUser;

  const AuthUpdateState({required this.loggedUser, required this.departaments});
}

class AuthSuccessState implements AuthenticatorState {
  final String message;
  AuthSuccessState({required this.message});
}

class AuthLoadingState implements AuthenticatorState {}

class AuthErrorState implements AuthenticatorState {
  final String message;
  AuthErrorState({required this.message});
}
