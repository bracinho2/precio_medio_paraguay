import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:precio_medio_paraguay/app/modules/authenticator/presenter/auth_register_page/presenter/states/auth_register_state.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/presenter/auth_register_page/presenter/widgets/loading_form_widget.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/presenter/auth_register_page/presenter/widgets/update_form_widget.dart';

import '../../../../../core/widgets/custom_background_widget.dart';

import 'controller/auth_register_controller.dart';
import 'widgets/error_form_widget.dart';
import 'widgets/register_form_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
    required this.authRegisterController,
  }) : super(key: key);

  final AuthRegisterController authRegisterController;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthRegisterController get _controller => widget.authRegisterController;

  @override
  void initState() {
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundWidget(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 600,
            ),
            child: ValueListenableBuilder(
              valueListenable: _controller,
              builder: (context, state, _) {
                if (state is AuthRegisterState) {
                  return RegisterFormWidget(
                    state: state,
                    authRegisterController: context.read(),
                    authRegisterDelegate: context.read(),
                  );
                }

                if (state is AuthUpdateState) {
                  return UpdateFormWidget(
                    state: state,
                    authRegisterController: context.read(),
                    authRegisterDelegate: context.read(),
                  );
                }

                if (state is AuthLoadingState) {
                  return const LoadingFormWidget();
                }

                if (state is AuthErrorState) {
                  return ErrorFormWidget(
                    message: state.message,
                    delegate: context.read(),
                  );
                }

                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
