import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_fuel_type_enum.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_gear_enum.dart';
import 'package:precio_medio_paraguay/app/core/theme/colos_scheme.dart';
import 'package:precio_medio_paraguay/app/core/theme/text_styles.dart';

import '../../../../../core/widgets/custom_buttom_widget.dart';
import '../../../../../core/widgets/custom_drop_down_widget.dart';
import '../../../../../core/widgets/custom_text_form_field_widget.dart';
import '../../../../../core/widgets/identify_large_widget.dart';
import '../../../../../core/validators/car_register_validators.dart';
import '../controller/car_controller.dart';
import '../../delegate/car_delegate.dart';

class CarRegisterFormWidget extends StatefulWidget {
  const CarRegisterFormWidget({
    super.key,
    required this.controller,
    required this.delegate,
  });

  final CarController controller;
  final CarDelegate delegate;

  @override
  State<CarRegisterFormWidget> createState() => _CarRegisterFormWidgetState();
}

class _CarRegisterFormWidgetState extends State<CarRegisterFormWidget> {
  CarController get _controller => widget.controller;
  CarDelegate get _delegate => widget.delegate;

  String? uid;
  final manufacturer = TextEditingController();
  final model = TextEditingController();
  final year = TextEditingController();
  final color = TextEditingController();
  final phone = TextEditingController();

  DateTime? registeredAt;
  DateTime? lastUpdate;

  String? departamentoID;
  String? cityID;

  CarFuelTypeENUM? selectedFuel;

  onFuelChanged(CarFuelTypeENUM? value) {
    if (value != selectedFuel) {
      _controller.setParams(fuel: value?.name);
    }
    setState(() {
      selectedFuel = value;
    });
  }

  CarGearTypeENUM? selectedGear;

  onGearChanged(CarGearTypeENUM? value) {
    if (value != selectedGear) {
      _controller.setParams(gear: value?.name);
    }

    setState(() {
      selectedGear = value;
    });
  }

  @override
  void dispose() {
    manufacturer.dispose();
    model.dispose();
    year.dispose();
    color.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          key: _controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const IdentifyLargeWidget(),
              CustomTextFormFieldWidget(
                label: 'Fabricante',
                controller: manufacturer,
                validator: CarValidators.validateManufacturer,
              ),
              CustomTextFormFieldWidget(
                label: 'Modelo',
                controller: model,
                validator: CarValidators.validateManufacturer,
              ),
              CustomTextFormFieldWidget(
                label: 'Ano',
                controller: year,
                validator: CarValidators.validateManufacturer,
              ),
              CustomTextFormFieldWidget(
                label: 'Cor',
                controller: color,
                validator: CarValidators.validateManufacturer,
              ),
              CustomDropDownWidget<CarFuelTypeENUM>(
                value: selectedFuel,
                label: 'Combustível',
                items: CarFuelTypeENUM.values.map(
                  (fuel) {
                    return DropdownMenuItem<CarFuelTypeENUM>(
                      value: fuel,
                      child: Row(
                        children: [
                          Text(fuel.name),
                        ],
                      ),
                    );
                  },
                ).toList(),
                onChanged: onFuelChanged,
                validator: CarValidators.validateFuel,
              ),
              CustomDropDownWidget<CarGearTypeENUM>(
                value: selectedGear,
                label: 'Cambio',
                items: CarGearTypeENUM.values.map(
                  (gear) {
                    return DropdownMenuItem<CarGearTypeENUM>(
                      value: gear,
                      child: Row(
                        children: [
                          Text(gear.value),
                        ],
                      ),
                    );
                  },
                ).toList(),
                onChanged: onGearChanged,
                validator: CarValidators.validateGear,
              ),
              CustomButtomWidget(
                label: uid != null ? 'Update' : 'Send',
                onTap: () async {
                  _controller.setParams(
                    manufacturer: manufacturer.text,
                    model: model.text,
                    year: year.text,
                    color: color.text,
                    fuel: selectedFuel?.name,
                    gear: selectedGear?.name,
                  );

                  final status = await _controller.validateForm();
                  _delegate.registerCar(status: status);
                },
              ),
              CustomButtomWidget(
                label: 'Voltar',
                onTap: () {
                  _delegate.goBack();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomConfirmAlertDialog extends StatelessWidget {
  const CustomConfirmAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Informar Carro',
        style: AppTextStyles.alertDialogText,
      ),
      content: const Text(
        'Os dados do veículo estão corretos?',
        style: AppTextStyles.alertDialogText,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Modular.to.pop();
          },
          child: const Text(
            'Não',
            style: AppTextStyles.alertDialogText,
          ),
        ),
        TextButton(
          onPressed: () async {},
          child: const Text(
            'Sim',
            style: AppTextStyles.alertDialogText,
          ),
        ),
      ],
      backgroundColor: AppColors.accentColor,
    );
  }
}
