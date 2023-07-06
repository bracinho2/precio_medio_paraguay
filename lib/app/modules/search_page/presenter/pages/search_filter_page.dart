import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/core/theme/app_padding.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/presenter/controller/search_page_controller.dart';
import 'package:precio_medio_paraguay/app/core/widgets/identify_large_widget.dart';

import '../../../../core/theme/colos_scheme.dart';
import '../../../../core/validators/validators.dart';
import '../../domain/entities/search_filter/car_manufacturer_entity.dart';
import '../../domain/entities/search_filter/car_model_entity.dart';
import '../../domain/entities/search_filter/car_year_entity.dart';
import '../../domain/entities/search_filter/search_filter_entity.dart';

import '../../../../core/widgets/custom_buttom_widget.dart';
import '../widgets/custom_dropdown_button_widget.dart';

class SearchFilterPage extends StatefulWidget {
  const SearchFilterPage({
    super.key,
    required this.controller,
    required this.searchFilterEntity,
  });

  final SearchPageController controller;
  final SearchFilterEntity searchFilterEntity;

  @override
  State<SearchFilterPage> createState() => _SearchFilterPageState();
}

class _SearchFilterPageState extends State<SearchFilterPage> {
  SearchPageController get _controller => widget.controller;
  SearchFilterEntity get _filters => widget.searchFilterEntity;

  CarManufacturerEntity? selectedManufacturer;
  CarModelEntity? selectedModel;
  CarYearEntity? selectedYear;

  bool activeSelectModel = false;
  bool activeSelectYear = false;

  onCarManufacturerChanged(CarManufacturerEntity? value) {
    if (value != selectedManufacturer) {
      _controller.setParams(manufacturer: value?.name);

      selectedModel = null;
      activeSelectModel = true;
    }

    setState(() {
      selectedManufacturer = value;
    });
  }

  onCarModelChanged(CarModelEntity? value) {
    if (value != selectedModel) {
      _controller.setParams(model: value?.name);
      selectedYear = null;
      activeSelectYear = true;
    }

    setState(() {
      selectedModel = value;
    });
  }

  onCarYearChanged(CarYearEntity? value) {
    _controller.setParams(year: value?.year);
    setState(() {
      selectedYear = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _controller.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const IdentifyLargeWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomDropDownWidget<CarManufacturerEntity>(
              value: selectedManufacturer,
              items: _filters.myFilters.map((manufacturer) {
                return DropdownMenuItem<CarManufacturerEntity>(
                  value: manufacturer,
                  child: Text(
                    manufacturer.name,
                    style: const TextStyle(
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
              hintText: 'Select Manufacturer',
              onChanged: onCarManufacturerChanged,
              validator: Validators.selectCarManufacturer,
              active: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomDropDownWidget<CarModelEntity>(
              value: selectedModel,
              items: (selectedManufacturer?.models ?? []).map((model) {
                return DropdownMenuItem<CarModelEntity>(
                  value: model,
                  child: Text(
                    model.name,
                    style: const TextStyle(
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
              hintText: 'Select Vehicle',
              onChanged: onCarModelChanged,
              validator: Validators.selectCarModel,
              active: activeSelectModel,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomDropDownWidget<CarYearEntity>(
              value: selectedYear,
              items: (selectedModel?.years ?? []).map((year) {
                return DropdownMenuItem<CarYearEntity>(
                  value: year,
                  child: Text(
                    year.year,
                    style: const TextStyle(
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
              hintText: 'Select Year',
              onChanged: onCarYearChanged,
              validator: Validators.selectCarYear,
              active: activeSelectYear,
            ),
          ),
          Padding(
            padding: AppPadding.horizontalMedium + AppPadding.topLarge,
            child: CustomButtomWidget(
              label: 'Search',
              onTap: () {
                _controller.searchValidate();
              },
            ),
          ),
          Padding(
            padding: AppPadding.horizontalMedium,
            child: CustomButtomWidget(
              label: 'Voltar',
              onTap: () {
                if (Modular.to.canPop()) {
                  Modular.to.pop();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
