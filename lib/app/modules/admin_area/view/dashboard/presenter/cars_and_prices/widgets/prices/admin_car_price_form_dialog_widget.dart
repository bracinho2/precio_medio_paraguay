import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_sale_type_enum.dart';
import 'package:precio_medio_paraguay/app/core/extensions/currency.dart';
import 'package:precio_medio_paraguay/app/core/theme/app_padding.dart';
import 'package:precio_medio_paraguay/app/core/widgets/custom_buttom_widget.dart';
import 'package:precio_medio_paraguay/app/modules/admin_area/view/delegate/admin_area_delegate.dart';

import 'package:precio_medio_paraguay/app/modules/car_prices/core/validators/car_price_validators.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/entities/car_price_entitity.dart';

import '../../../../../../../../core/common/address.dart';
import '../../../../../../../../core/common/coordinates.dart';
import '../../../../../../../../core/enums/car_fuel_type_enum.dart';
import '../../../../../../../../core/enums/car_gear_enum.dart';
import '../../../../../../../../core/input_formatters/currency_formatter.dart';
import '../../../../../../../../core/theme/colos_scheme.dart';
import '../../../../../../../../core/widgets/custom_drop_down_widget.dart';
import '../../../../../../../../core/widgets/custom_price_form_field_widget.dart';
import '../../../../../../../../core/widgets/custom_text_form_field_widget.dart';
import '../../../../../../../car_register/domain/entities/car_entity.dart';
import '../../../../../../../regioes/dominio/entities/departamento_entity.dart';
import '../../../../../../../regioes/dominio/entities/municipio_entity.dart';
import '../../controller/cars_and_prices_controller.dart';

class AdminCarPriceFormDialogWidget extends StatefulWidget {
  const AdminCarPriceFormDialogWidget({
    super.key,
    required this.cars,
    required this.departaments,
    required this.carsAndPricesController,
    required this.delegate,
    this.carPriceEntity,
  });

  final List<CarEntity> cars;
  final List<DepartamentoEntity> departaments;
  final CarsAndPricesController carsAndPricesController;
  final AdminAreaDelegate delegate;
  final CarPriceEntity? carPriceEntity;

  @override
  State<AdminCarPriceFormDialogWidget> createState() =>
      _AdminCarPriceFormDialogWidgetState();
}

class _AdminCarPriceFormDialogWidgetState
    extends State<AdminCarPriceFormDialogWidget> {
  List<CarEntity> get _cars => widget.cars;
  List<DepartamentoEntity> get _departaments => widget.departaments;
  AdminAreaDelegate get _delegate => widget.delegate;
  CarPriceEntity? get _price => widget.carPriceEntity;

  CarsAndPricesController get _controller => widget.carsAndPricesController;

  void carPriceExists() {
    if (_price != null) {
      uid = _price?.uid;
      selectedCar = _cars.firstWhere((car) => car.uid == _price!.car);
      selectedDepartament = _departaments.firstWhere(
        (departament) => departament.name == _price!.address.departament,
      );
      selectedCity = selectedDepartament!.cities
          .firstWhere((city) => city.name == _price!.address.city);

      coordinates = _price!.coordinates;
      selectedCarSaleType = _price!.carSaleType;
      price = _price!.price;
      yearController.text = _price!.year;
      colorController.text = _price!.color;
      selectedFuelType = _price!.fuel;
      selectedGearType = _price!.gear;
      priceController.text = _price!.price.toGuarani.replaceAll('G\$', '');
      registeredAt = _price!.registeredAt;
      lastUpdate = _price!.lastUpdate;
      active = _price!.active;
    }
  }

  String? uid;
  String? car;
  Address? address;
  Coordinates? coordinates;
  CarSaleTypeENUM? carSaleType;
  double? price;
  String? year;
  String? color;
  CarFuelTypeENUM? fuel;
  CarGearTypeENUM? gear;
  DateTime? registeredAt;
  DateTime? lastUpdate;
  String? informedBy;
  bool active = false;

  CarEntity? selectedCar;

  final priceController = TextEditingController();
  final colorController = TextEditingController();
  final yearController = TextEditingController();

  onCarChanged(CarEntity? value) {
    if (value != selectedCar) {
      _controller.setPriceParams(car: value?.model);
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
      _controller.setPriceParams(departament: value?.name);

      selectedCity = null;
      activeSelectCity = true;
    }

    setState(() {
      selectedCity = null;
      selectedDepartament = value;
    });
  }

  onCityChanged(MunicipioEntity? value) {
    _controller.setPriceParams(city: value?.name);
    setState(() {
      selectedCity = value!;
    });
  }

  CarSaleTypeENUM? selectedCarSaleType;

  onSaleTypeChange(CarSaleTypeENUM? value) {
    if (value != selectedCarSaleType) {
      _controller.setPriceParams(carSaleType: value?.name);
    }
    setState(() {
      selectedCarSaleType = value;
    });
  }

  CarFuelTypeENUM? selectedFuelType;

  onFuelTypeChange(CarFuelTypeENUM? value) {
    if (value != selectedFuelType) {
      _controller.setPriceParams(carFuelType: value?.name);
    }
    setState(() {
      selectedFuelType = value;
    });
  }

  CarGearTypeENUM? selectedGearType;

  onGearTypeChange(CarGearTypeENUM? value) {
    if (value != selectedFuelType) {
      _controller.setPriceParams(carGearType: value?.name);
    }
    setState(() {
      selectedGearType = value;
    });
  }

  @override
  void initState() {
    carPriceExists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.allLarge,
      child: Form(
        key: _controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: AppPadding.bottomSmall,
              child: CustomDropDownWidget<CarEntity>(
                value: selectedCar,
                label: 'Veiculo',
                items: _cars.map(
                  (value) {
                    return DropdownMenuItem<CarEntity>(
                      value: value,
                      child: Row(
                        children: [
                          Text(
                            '${value.manufacturer.toUpperCase()} ${value.model.toUpperCase()}',
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
                onChanged: onCarChanged,
                validator: CarPriceValidators.validateCar,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: AppPadding.bottomSmall + AppPadding.rightSmall,
                    child: CustomDropDownWidget<DepartamentoEntity>(
                      value: selectedDepartament,
                      label: 'Departamento',
                      items: _departaments.map(
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
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: AppPadding.bottomSmall,
                    child: CustomDropDownWidget<MunicipioEntity>(
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
                  ),
                ),
              ],
            ),
            Padding(
              padding: AppPadding.bottomSmall,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: AppPadding.rightSmall,
                      child: CustomDropDownWidget<CarSaleTypeENUM>(
                        value: selectedCarSaleType,
                        label: 'Tipo de Venda',
                        items: CarSaleTypeENUM.values
                            .map(
                              (type) => DropdownMenuItem<CarSaleTypeENUM>(
                                value: type,
                                child: Row(
                                  children: [
                                    Text(type.value),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: onSaleTypeChange,
                        validator: CarPriceValidators.validateSaleType,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: AppPadding.rightSmall,
                      child: CustomTextFormFieldWidget(
                        label: 'Ano',
                        controller: yearController,
                        validator: CarPriceValidators.validateYear,
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomTextFormFieldWidget(
                      label: 'Cor',
                      controller: colorController,
                      validator: CarPriceValidators.validateColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: AppPadding.bottomSmall,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: AppPadding.rightSmall,
                      child: CustomDropDownWidget<CarFuelTypeENUM>(
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
                    ),
                  ),
                  Expanded(
                    child: CustomDropDownWidget<CarGearTypeENUM>(
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: AppPadding.bottomSmall,
              child: CustomPriceFormFieldWidget(
                label: 'Preço',
                controller: priceController,
                validator: CarPriceValidators.validatePrice,
                prefix: 'G\$',
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CurrencyInputFormatter(),
                ],
              ),
            ),
            Switch(
                activeColor: AppColors.accentColor,
                value: active,
                onChanged: (value) {
                  setState(() {
                    active = value;
                  });
                }),
            Padding(
              padding: AppPadding.bottomSmall,
              child: CustomButtomWidget(
                label: uid != null ? 'Atualizar' : 'Registrar',
                onTap: () async {
                  if (uid != null) {
                    _controller.setPriceParams(
                      uid: uid,
                      car: selectedCar?.uid,
                      departament: selectedDepartament?.name,
                      city: selectedCity?.name,
                      carSaleType: selectedCarSaleType?.name,
                      year: yearController.text,
                      color: colorController.text,
                      carFuelType: selectedFuelType?.name,
                      carGearType: selectedGearType?.name,
                      price: priceController.text,
                      active: active,
                    );

                    final status = await _controller.updateCarPrice();
                    _delegate.updateCarSuccess(status: status);
                  } else {
                    _controller.setPriceParams(
                      car: selectedCar?.uid,
                      departament: selectedDepartament?.name,
                      city: selectedCity?.name,
                      carSaleType: selectedCarSaleType?.name,
                      year: yearController.text,
                      color: colorController.text,
                      carFuelType: selectedFuelType?.name,
                      carGearType: selectedGearType?.name,
                      price: priceController.text,
                    );

                    final status = await _controller.registerCarPrice();
                    _delegate.registerCarSuccess(status: status);
                  }
                },
              ),
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
