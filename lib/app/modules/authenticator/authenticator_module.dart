import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/delegate/authenticator_delegate.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/domain/usecases/login_user_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/domain/usecases/register_user_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/external/http/firebase_auth_datasource_impl.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/infra/datasource/auth_datasource.dart';

import 'package:precio_medio_paraguay/app/modules/authenticator/presenter/auth_register_page/presenter/controller/auth_register_controller.dart';

import 'package:precio_medio_paraguay/app/modules/regioes/regioes_module.dart';

import 'controller/public_auth_controller.dart';
import 'domain/repository/auth_repository.dart';

import 'domain/usecases/get_user_by_id_usercase.dart';
import 'domain/usecases/update_user_usecase.dart';
import 'infra/repository/auth_repository_impl.dart';
import 'presenter/auth_login_page/presenter/controller/auth_login_controller.dart';

import 'presenter/auth_login_page/presenter/login_page.dart';
import 'presenter/auth_register_page/presenter/register_page.dart';

class AuthenticatorModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<AuthDatasource>(
            (i) => FireaseAuthDatasourceImpl(i()),
            export: true),
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(i()),
            export: true),

        /// AUTH REGISTER
        Bind.lazySingleton<GetUserByIdUsecase>((i) => GetUserByID(i()),
            export: true),
        Bind.lazySingleton<UpdateUserUsecase>((i) => UpdateUser(i())),
        Bind.lazySingleton<RegisterUserUsecase>((i) => RegisterUser(i())),

        Bind.lazySingleton(
            (i) => AuthRegisterController(i(), i(), i(), i(), i(), i()),
            export: true),

        /// AUTH LOGIN
        Bind.lazySingleton<LoginUserUsecase>((i) => LoginUser(i()),
            export: true),
        Bind.lazySingleton<AuthLoginController>(
            (i) => AuthLoginController(
                  i(),
                  i(),
                ),
            export: true),
        Bind.lazySingleton<AuthenticatorDelegate>(
            (i) => AuthenticatorPageFlow()),
        Bind.lazySingleton((i) => PublicAuthController(i(), i()), export: true),
      ];

  @override
  List<Module> get imports => [
        RegioesModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/register/',
          child: (context, args) => RegisterPage(
            authRegisterController: context.read(),
          ),
        ),
        ChildRoute(
          '/login/',
          child: (context, args) => LoginPage(
            controller: context.read(),
            delegate: context.read(),
            snackBarManager: context.read(),
          ),
        ),
      ];
}
