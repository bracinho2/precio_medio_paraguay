import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../../../core/theme/app_padding.dart';
import '../../../../../../core/theme/text_styles.dart';
import '../../../../../../core/validators/validators.dart';
import '../../../../../../core/widgets/custom_buttom_widget.dart';
import '../../../../../../core/widgets/custom_text_password_form_field_widget.dart';
import '../../../../../regioes/dominio/entities/departamento_entity.dart';
import '../../../../../regioes/dominio/entities/municipio_entity.dart';
import '../../../../../../core/widgets/identify_large_widget.dart';
import '../../../../delegate/authenticator_delegate.dart';
import '../../../../../../core/widgets/custom_text_form_field_widget.dart';

import '../controller/auth_register_controller.dart';

import '../states/auth_register_state.dart';
import '../../../../../../core/widgets/custom_drop_down_widget.dart';
import '../../../../../../core/extensions/datetime.dart';

class UpdateFormWidget extends StatefulWidget {
  const UpdateFormWidget({
    super.key,
    required this.state,
    required this.authRegisterController,
    required this.authRegisterDelegate,
  });

  final AuthUpdateState state;
  final AuthRegisterController authRegisterController;
  final AuthenticatorDelegate authRegisterDelegate;

  @override
  State<UpdateFormWidget> createState() => _UpdateFormWidgetState();
}

class _UpdateFormWidgetState extends State<UpdateFormWidget> {
  AuthRegisterController get _controller => widget.authRegisterController;
  AuthenticatorDelegate get _delegate => widget.authRegisterDelegate;
  AuthUpdateState get _state => widget.state;

  DepartamentoEntity? selectedDepartament;
  MunicipioEntity? selectedCity;

  String? uid;
  final name = TextEditingController();
  final identity = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();

  DateTime? registeredAt;
  DateTime? lastUpdate;

  String? departamentoID;
  String? cityID;

  bool activeSelectCity = false;

  onDepartamentChanged(DepartamentoEntity? value) {
    if (value != selectedDepartament) {
      _controller.setParams(departament: value?.name);

      selectedCity = null;
      activeSelectCity = true;
    }

    setState(() {
      selectedCity = null;
      selectedDepartament = value;
    });
  }

  onCityChanged(MunicipioEntity? value) {
    _controller.setParams(city: value?.name);
    setState(() {
      selectedCity = value!;
    });
  }

  @override
  void dispose() {
    name.dispose();
    identity.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = _state.loggedUser;

    if (user != null) {
      uid = user.uid;
      name.text = user.name;
      identity.text = user.identify;
      email.text = user.email;
      password.text = user.password;
      phone.text = user.phone;
      registeredAt = user.registeredAt;
      lastUpdate = user.lastUpdate;
      departamentoID = user.address!.departament;
      cityID = user.address!.city;
    }

    if (departamentoID != null && selectedDepartament == null) {
      selectedDepartament = _state.departaments
          .firstWhere((element) => element.name == departamentoID);

      if (selectedDepartament != null && selectedCity == null) {
        selectedCity = selectedDepartament!.cities
            .where((element) => element.name == cityID)
            .first;
      }
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: _controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const IdentifyLargeWidget(),
                CustomTextFormFieldWidget(
                  label: 'Nome Completo',
                  controller: name,
                  validator: Validators.validateCompleteName,
                ),
                CustomTextFormFieldWidget(
                  label: 'Cedula de Identidad',
                  controller: identity,
                  validator: Validators.validadeIdentify,
                ),
                CustomTextFormFieldWidget(
                  label: 'Email',
                  controller: email,
                  validator: Validators.validateEmail,
                ),
                CustomTextPasswordFormFieldWidget(
                  label: 'Senha',
                  controller: password,
                  validator: Validators.validatePassword,
                  obscureText: true,
                ),
                CustomTextFormFieldWidget(
                  label: 'Phone',
                  controller: phone,
                  validator: Validators.validatePhone,
                  inputFormatters: [
                    MaskTextInputFormatter(
                        mask: '+595#########',
                        filter: {"#": RegExp(r'[0-9]')},
                        type: MaskAutoCompletionType.lazy)
                  ],
                ),
                CustomDropDownWidget<DepartamentoEntity>(
                  value: selectedDepartament,
                  label: 'Departamento',
                  items: widget.state.departaments.map(
                    (value) {
                      return DropdownMenuItem<DepartamentoEntity>(
                        value: value,
                        child: Row(
                          children: [
                            Text(value.name),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: onDepartamentChanged,
                  validator: Validators.validateDepartament,
                ),
                CustomDropDownWidget<MunicipioEntity>(
                  value: selectedCity,
                  label: 'Municipio',
                  items: (selectedDepartament?.cities ?? [])
                      .map(
                        (value) => DropdownMenuItem<MunicipioEntity>(
                          value: value,
                          child: Row(
                            children: [
                              Text(value.name),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: onCityChanged,
                  validator: Validators.validateCity,
                ),
                if (registeredAt != null)
                  Padding(
                    padding: AppPadding.bottomSmall,
                    child: Text(
                      'Registrado em ${registeredAt?.toHumanDateTime()}',
                      style: AppTextStyles.buttomLabelWhite,
                    ),
                  ),
                if (lastUpdate != null)
                  Padding(
                    padding: AppPadding.bottomSmall,
                    child: Text(
                      'Atualizado em ${lastUpdate?.toHumanDateTime()}',
                      style: AppTextStyles.buttomLabelWhite,
                    ),
                  ),
                CustomButtomWidget(
                  label: 'Update',
                  onTap: () async {
                    _controller.setParams(
                      uid: uid,
                      name: name.text,
                      identify: identity.text,
                      email: email.text,
                      password: password.text,
                      phone: phone.text,
                      departament: selectedDepartament?.name,
                      city: selectedCity?.name,
                      registeredAt: registeredAt,
                      lastUpdate: lastUpdate,
                    );
                    final status = await _controller.updateUser();

                    _delegate.updateUser(status: status);
                  },
                ),
                CustomButtomWidget(
                  label: 'Voltar',
                  onTap: () {
                    if (Modular.to.canPop()) {
                      Modular.to.pop();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
