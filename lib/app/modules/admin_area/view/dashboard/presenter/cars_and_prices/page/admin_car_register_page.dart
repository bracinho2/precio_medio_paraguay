import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/core/services/snackbar_manager/snackbar_manager.dart';
import 'package:precio_medio_paraguay/app/core/widgets/custom_background_widget.dart';
import 'package:precio_medio_paraguay/app/modules/admin_area/view/delegate/admin_area_delegate.dart';

import '../../../../../../../core/enums/car_fuel_type_enum.dart';
import '../../../../../../../core/enums/car_gear_enum.dart';
import '../../../../../../../core/validators/car_register_validators.dart';
import '../../../../../../../core/widgets/custom_buttom_widget.dart';
import '../../../../../../../core/widgets/custom_drop_down_widget.dart';
import '../../../../../../../core/widgets/custom_text_form_field_widget.dart';

import '../controller/cars_and_prices_controller.dart';

class AdminCarRegisterPage extends StatefulWidget {
  const AdminCarRegisterPage({
    super.key,
    required this.controller,
    required this.delegate,
    required this.snackBarManager,
  });

  final CarsAndPricesController controller;
  final AdminAreaDelegate delegate;
  final SnackBarManager snackBarManager;

  @override
  State<AdminCarRegisterPage> createState() => _AdminCarRegisterPageState();
}

class _AdminCarRegisterPageState extends State<AdminCarRegisterPage> {
  CarsAndPricesController get _controller => widget.controller;
  AdminAreaDelegate get _delegate => widget.delegate;
  SnackBarManager get _snackBar => widget.snackBarManager;

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
      _controller.setCarParams(fuel: value?.name);
    }
    setState(() {
      selectedFuel = value;
    });
  }

  CarGearTypeENUM? selectedGear;

  onGearChanged(CarGearTypeENUM? value) {
    if (value != selectedGear) {
      _controller.setCarParams(gear: value?.name);
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
    return CustomBackgroundWidget(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 600,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                        _controller.setCarParams(
                          manufacturer: manufacturer.text,
                          model: model.text,
                          year: year.text,
                          color: color.text,
                          fuel: selectedFuel?.name,
                          gear: selectedGear?.name,
                        );

                        final status = await _controller.registerCar();
                        if (status) {
                          _delegate.registerCarSuccess(status: status);
                        } else {
                          _snackBar.showError(
                              message: 'Não foi possível registrar seu carro!');
                        }
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
          ),
        ),
      ),
    );
  }
}
