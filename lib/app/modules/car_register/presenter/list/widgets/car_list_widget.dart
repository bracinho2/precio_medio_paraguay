import 'package:flutter/material.dart';

import 'package:precio_medio_paraguay/app/core/widgets/identify_large_widget.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/presenter/delegate/car_delegate.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/presenter/list/states/car_list_states.dart';

import '../../../../../core/theme/app_padding.dart';
import '../../../../../core/theme/colos_scheme.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../../core/widgets/custom_buttom_widget.dart';

class CarListWidget extends StatelessWidget {
  const CarListWidget({
    Key? key,
    required this.state,
    required this.delegate,
  }) : super(key: key);

  final CarListSuccessState state;
  final CarDelegate delegate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.verticalLarge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const IdentifyLargeWidget(),
          Expanded(
            child: ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (context, index) {
                final item = state.cars[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => CustomAlertDialog(
                          maxHeight: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.car_crash,
                                size: 50,
                                color: AppColors.accentColor,
                              ),
                              Text(
                                '${item.manufacturer.toUpperCase()} ${item.model.toUpperCase()}',
                                style: AppTextStyles.listTileTitle,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                item.color,
                                style: AppTextStyles.listTileSubtitle,
                              ),
                              Text(
                                item.year,
                                style: AppTextStyles.listTileSubtitle,
                              ),
                              Text(
                                item.gear,
                                style: AppTextStyles.listTileSubtitle,
                              ),
                              Text(
                                item.fuel,
                                style: AppTextStyles.listTileSubtitle,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomButtomWidget(
                                label: 'Remover',
                                onTap: () {
                                  delegate.goBack();
                                },
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              CustomButtomWidget(
                                label: 'Voltar',
                                onTap: () {
                                  delegate.goBack();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: AppPadding.horizontalMedium,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Container(
                                color: AppColors.accentColor,
                                width: 60,
                                height: 60,
                                child: const Icon(
                                  Icons.car_crash,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.model,
                                      style: AppTextStyles.listTileTitle,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      item.manufacturer,
                                      style: AppTextStyles.listTileSubtitle,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: AppPadding.horizontalMedium,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      item.color,
                                      style: AppTextStyles.listTileGuarani,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          CustomButtomWidget(
            label: 'Voltar',
            onTap: () {
              delegate.goBack();
            },
          ),
        ],
      ),
    );
  }
}
