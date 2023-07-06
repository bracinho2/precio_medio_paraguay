import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/controller/public_auth_controller.dart';

import 'package:precio_medio_paraguay/app/modules/authenticator/domain/usecases/register_user_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/domain/usecases/update_user_usecase.dart';

import '../../../../../../core/services/locations/location_service.dart';

import '../../../../../regioes/dominio/usecases/get_all_departamentos_usecase.dart';

import '../../../../../users/model/user_entity.dart';

import '../../../../domain/entities/user_register_params.dart';

import '../../../../domain/usecases/get_user_by_id_usercase.dart';
import '../states/auth_register_state.dart';

class AuthRegisterController extends ValueNotifier<AuthenticatorState> {
  final GetAllDepartamentUsecase _getAllDepartamentosUsecase;
  final GetUserByIdUsecase _getUserByIdUsecase;
  final RegisterUserUsecase _registerUsecase;
  final UpdateUserUsecase _updateUsecase;
  final ILocationService _locationService;
  final PublicAuthController _publicAuthController;

  AuthRegisterController(
    this._getAllDepartamentosUsecase,
    this._registerUsecase,
    this._locationService,
    this._updateUsecase,
    this._getUserByIdUsecase,
    this._publicAuthController,
  ) : super(AuthLoadingState());

  final formKey = GlobalKey<FormState>();

  final params = UserParamsEntity.isEmpty();

  Future<void> init() async {
    _hasLoggedUser();
  }

  Future<UserEntity?> _getUserById({required String uid}) async {
    return await _getUserByIdUsecase.call(uid: uid);
  }

  Future<void> _hasLoggedUser() async {
    final hasLoggedUser = await _publicAuthController.whatUserIsLogged();

    if (hasLoggedUser != null) {
      final user = await _getUserById(uid: hasLoggedUser);

      final departaments = await _getAllDepartamentosUsecase.call();

      departaments.fold(
        (error) => value = AuthErrorState(message: error.toString()),
        (success) => value = AuthUpdateState(
          loggedUser: user,
          departaments: success,
        ),
      );
    } else {
      registerUser();
    }
  }

  Future<void> registerUser() async {
    final response = await _getAllDepartamentosUsecase.call();
    response.fold(
      (error) => AuthErrorState(message: error.toString()),
      (success) {
        value = AuthRegisterState(departaments: success);
      },
    );
  }

  void setParams({
    String? uid,
    String? name,
    String? identify,
    String? email,
    String? password,
    String? phone,
    String? departament,
    String? city,
    DateTime? registeredAt,
    DateTime? lastUpdate,
  }) {
    params.uid = uid ?? params.uid;
    params.name = name ?? params.name;
    params.identify = identify ?? params.identify;
    params.email = email ?? params.email;
    params.password = password ?? params.password;
    params.phone = phone ?? params.phone;
    params.address.departament = departament ?? params.address.departament;
    params.address.city = city ?? params.address.city;
    params.registeredAt = registeredAt ?? params.registeredAt;
    params.lastUpdate = lastUpdate ?? params.lastUpdate;
  }

  Future<void> getLocation() async {
    final response = await _locationService.getUserLocation();
    params.coordinates.latitude = response.latitude;
    params.coordinates.longitude = response.longitude;
  }

  Future<bool> updateUser() async {
    await getLocation();

    if (formKey.currentState!.validate()) {
      params.lastUpdate = DateTime.now();
      return await _updateUsecase.call(
          user: UserEntity.fromParams(params: params));
    }
    return false;
  }

  Future<bool> validateParams() async {
    await getLocation();

    if (formKey.currentState!.validate()) {
      return await _registerUsecase.call(
          user: UserEntity.fromParams(params: params));
    }
    return false;
  }
}
