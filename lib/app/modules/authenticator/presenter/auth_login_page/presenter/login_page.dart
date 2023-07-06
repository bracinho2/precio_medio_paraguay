import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:precio_medio_paraguay/app/core/theme/app_padding.dart';
import 'package:precio_medio_paraguay/app/core/theme/text_styles.dart';
import 'package:precio_medio_paraguay/app/core/widgets/custom_background_widget.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/presenter/auth_login_page/presenter/controller/auth_login_controller.dart';

import 'package:precio_medio_paraguay/app/core/widgets/identify_large_widget.dart';

import '../../../../../core/services/snackbar_manager/snackbar_manager.dart';
import '../../../../../core/validators/validators.dart';
import '../../../../../core/widgets/custom_buttom_widget.dart';
import '../../../delegate/authenticator_delegate.dart';
import '../../../../../core/widgets/custom_text_form_field_widget.dart';
import '../../../../../core/widgets/custom_text_password_form_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
    required this.controller,
    required this.delegate,
    required this.snackBarManager,
  }) : super(key: key);

  final AuthLoginController controller;
  final AuthenticatorDelegate delegate;
  final SnackBarManager snackBarManager;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthLoginController get _controller => widget.controller;
  AuthenticatorDelegate get _delegate => widget.delegate;
  SnackBarManager get _snackBar => widget.snackBarManager;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    hasLoggedUser();
    super.initState();
  }

  Future<void> hasLoggedUser() async {
    _delegate.hasLoggedUser(hasLoggedUser: await _controller.hasLoggedUser());
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
            child: Form(
              key: _controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const IdentifyLargeWidget(),
                  CustomTextFormFieldWidget(
                    label: 'Email',
                    controller: emailController,
                    validator: LoginValidators.validateEmail,
                  ),
                  CustomTextPasswordFormFieldWidget(
                    label: 'Senha',
                    controller: passwordController,
                    validator: LoginValidators.validatePassword,
                    obscureText: true,
                  ),
                  CustomButtomWidget(
                    onTap: () async {
                      if (emailController.text.isEmpty &&
                          passwordController.text.isEmpty) {
                        _snackBar.showWarning(
                            message:
                                'Ainda não possui uma conta? Registre-se!');
                      } else {
                        final status = await _controller.login(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        _delegate.signIn(status: status);

                        if (!status &&
                            emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          _snackBar.showError(
                              message: 'Usuário ou Senha Inválido!');
                        }
                      }
                    },
                    label: 'Entrar',
                  ),
                  CustomButtomWidget(
                    label: 'Voltar',
                    onTap: () {
                      _delegate.goBack();
                    },
                  ),
                  LineButtonWidget(
                    delegate: context.read(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.verticalMedium,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Text(
            'Esqueci minha senha',
            style: AppTextStyles.forgetPasswordLabel,
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}

class LineButtonWidget extends StatelessWidget {
  const LineButtonWidget({super.key, required this.delegate});

  final AuthenticatorDelegate delegate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.verticalLarge + AppPadding.horizontalLarge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const ForgetPasswordWidget(),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Ainda não tem conta?',
              style: AppTextStyles.registerAccountLabel,
              children: <TextSpan>[
                TextSpan(
                  text: ' Registre-se!',
                  style: AppTextStyles.registerAccountRegisterLabel,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      delegate.registerPage();
                    },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
