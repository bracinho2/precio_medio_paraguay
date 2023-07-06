import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_sale_type_enum.dart';
import 'package:precio_medio_paraguay/app/core/widgets/custom_buttom_widget.dart';
import 'package:precio_medio_paraguay/app/core/widgets/identify_large_widget.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/core/validators/car_price_validators.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/presenter/register_page/controller/car_price_controller.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/presenter/register_page/states/car_price_states.dart';
import '../../../../../core/enums/car_fuel_type_enum.dart';
import '../../../../../core/enums/car_gear_enum.dart';
import '../../../../../core/input_formatters/currency_formatter.dart';
import '../../../../../core/widgets/custom_drop_down_widget.dart';
import '../../../../../core/widgets/custom_text_form_field_widget.dart';
import '../../../../regioes/dominio/entities/departamento_entity.dart';
import '../../../../regioes/dominio/entities/municipio_entity.dart';
import '../../../../car_register/domain/entities/car_entity.dart';
import '../../../../../core/extensions/datetime.dart';
import '../delegate/car_price_delegate.dart';

class CarPriceRegisterFormWidget extends StatefulWidget {
  const CarPriceRegisterFormWidget({
    super.key,
    required this.state,
    required this.carPriceController,
    required this.delegate,
  });

  final CarPriceRegisterState state;
  final CarPriceController carPriceController;
  final CarPriceDelegate delegate;

  @override
  State<CarPriceRegisterFormWidget> createState() =>
      _CarPriceRegisterFormWidgetState();
}

class _CarPriceRegisterFormWidgetState
    extends State<CarPriceRegisterFormWidget> {
  CarPriceRegisterState get _state => widget.state;
  CarPriceController get _controller => widget.carPriceController;
  CarPriceDelegate get _delegate => widget.delegate;

  CarEntity? selectedCar;
  DateTime? expirationDate;

  final priceController = TextEditingController();
  final colorController = TextEditingController();
  final yearController = TextEditingController();
  final expirationController = TextEditingController();

  onCarChanged(CarEntity? value) {
    if (value != selectedCar) {
      _controller.setParams(departament: value?.model);
    }

    setState(() {
      selectedCar = value;
    });
  }

  DepartamentoEntity? selectedDepartament;
  MunicipioEntity? selectedCity;

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

  CarSaleTypeENUM? selectedCarSaleType;

  onSaleTypeChange(CarSaleTypeENUM? value) {
    if (value != selectedCarSaleType) {
      _controller.setParams(carSaleType: value?.name);
    }
    setState(() {
      selectedCarSaleType = value;
    });
  }

  void onExpirationDate(DateTime? value) {
    if (value != null) {
      expirationController.text = value.toHumanDate();
    }
  }

  CarFuelTypeENUM? selectedFuelType;

  onFuelTypeChange(CarFuelTypeENUM? value) {
    if (value != selectedFuelType) {
      _controller.setParams(carSaleType: value?.name);
    }
    setState(() {
      selectedFuelType = value;
    });
  }

  CarGearTypeENUM? selectedGearType;

  onGearTypeChange(CarGearTypeENUM? value) {
    if (value != selectedFuelType) {
      _controller.setParams(carSaleType: value?.name);
    }
    setState(() {
      selectedGearType = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _controller.formKey,
        child: Column(
          children: [
            const IdentifyLargeWidget(),
            CustomDropDownWidget<CarEntity>(
              value: selectedCar,
              label: 'Veiculo',
              items: _state.cars.map(
                (value) {
                  return DropdownMenuItem<CarEntity>(
                    value: value,
                    child: Row(
                      children: [
                        Text(
                          '${value.manufacturer} | ${value.model}',
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
              onChanged: onCarChanged,
              validator: CarPriceValidators.validateCar,
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
              validator: CarPriceValidators.validateDepartament,
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
              validator: CarPriceValidators.validateCity,
            ),
            CustomDropDownWidget<CarSaleTypeENUM>(
              value: selectedCarSaleType,
              label: 'Tipo de Venda',
              items: CarSaleTypeENUM.values
                  .map(
                    (type) => DropdownMenuItem<CarSaleTypeENUM>(
                      value: type,
                      child: Row(
                        children: [
                          Text(type.name),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onSaleTypeChange,
              validator: CarPriceValidators.validateSaleType,
            ),
            CustomTextFormFieldWidget(
              label: 'Ano',
              controller: yearController,
              validator: CarPriceValidators.validateYear,
            ),
            CustomTextFormFieldWidget(
              label: 'Cor',
              controller: colorController,
              validator: CarPriceValidators.validateColor,
            ),
            CustomDropDownWidget<CarFuelTypeENUM>(
              value: selectedFuelType,
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
              onChanged: onFuelTypeChange,
              validator: CarPriceValidators.validateFuel,
            ),
            CustomDropDownWidget<CarGearTypeENUM>(
              value: selectedGearType,
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
              onChanged: onGearTypeChange,
              validator: CarPriceValidators.validateGear,
            ),
            CustomTextFormFieldWidget(
              label: 'Preço',
              controller: priceController,
              validator: CarPriceValidators.validatePrice,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CurrencyInputFormatter(),
              ],
            ),
            CustomButtomWidget(
              label: 'Enviar',
              onTap: () async {
                _controller.setParams(
                  car: selectedCar?.uid,
                  departament: selectedDepartament?.name,
                  city: selectedCity?.name,
                  carSaleType: selectedCarSaleType?.name,
                  year: yearController.text,
                  color: colorController.text,
                  fuel: selectedFuelType?.name,
                  gear: selectedGearType?.name,
                  price: priceController.text,
                );

                final status = await _controller.registerPrice();
                _delegate.registerPrice(status: status);
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
    );
  }
}
