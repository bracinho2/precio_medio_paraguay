import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/core/theme/app_padding.dart';

import '../../../../../core/services/snackbar_manager/snackbar_manager.dart';
import '../../../../../core/validators/validators.dart';
import '../../../../../core/widgets/custom_background_widget.dart';
import '../../../../../core/widgets/custom_buttom_widget.dart';
import '../../../../../core/widgets/custom_text_form_field_widget.dart';
import '../../../../../core/widgets/custom_text_password_form_field_widget.dart';
import '../../../../../core/widgets/identify_large_widget.dart';

import '../../delegate/admin_area_delegate.dart';
import '../controller/admin_area_login_controller.dart';

class AdminAreaLoginPage extends StatefulWidget {
  const AdminAreaLoginPage({
    Key? key,
    required this.controller,
    required this.delegate,
    required this.snackBarManager,
  }) : super(key: key);

  final AdminAreaLoginController controller;
  final AdminAreaDelegate delegate;
  final SnackBarManager snackBarManager;

  @override
  State<AdminAreaLoginPage> createState() => _AdminAreaLoginPageState();
}

class _AdminAreaLoginPageState extends State<AdminAreaLoginPage> {
  AdminAreaLoginController get _controller => widget.controller;
  AdminAreaDelegate get _delegate => widget.delegate;
  SnackBarManager get _snackBar => widget.snackBarManager;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
                  Padding(
                    padding: AppPadding.bottomSmall,
                    child: CustomTextFormFieldWidget(
                      label: 'Email',
                      controller: emailController,
                      validator: LoginValidators.validateEmail,
                    ),
                  ),
                  Padding(
                    padding: AppPadding.bottomSmall,
                    child: CustomTextPasswordFormFieldWidget(
                      label: 'Senha',
                      controller: passwordController,
                      validator: LoginValidators.validatePassword,
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: AppPadding.bottomSmall,
                    child: CustomButtomWidget(
                      onTap: () async {
                        final status = await _controller.login(
                            email: emailController.text,
                            password: passwordController.text);

                        if (!status) {
                          _snackBar.showError(
                              message: 'Usuário não encontrado!');
                        }
                        _delegate.signIn(status: status);
                      },
                      label: 'Entrar',
                    ),
                  ),
                  Padding(
                    padding: AppPadding.bottomSmall,
                    child: CustomButtomWidget(
                      onTap: () async {
                        _delegate.goBack();
                      },
                      label: 'Voltar',
                    ),
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
