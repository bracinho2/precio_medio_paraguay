import 'package:flutter/material.dart';

import 'package:precio_medio_paraguay/app/core/extensions/currency.dart';
import 'package:precio_medio_paraguay/app/core/extensions/datetime.dart';
import 'package:precio_medio_paraguay/app/core/i18n/es_py.dart';

import 'package:precio_medio_paraguay/app/core/theme/app_padding.dart';
import 'package:precio_medio_paraguay/app/core/theme/colos_scheme.dart';
import 'package:precio_medio_paraguay/app/core/theme/text_styles.dart';

import 'package:precio_medio_paraguay/app/core/widgets/identify_large_widget.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/entities/car_price_entitity.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/presenter/list_page/delegate/car_list_delegate.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';

import '../../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../../core/widgets/custom_buttom_widget.dart';
import '../../../../../core/widgets/custom_list_tile_widget.dart';
import '../states/car_list_states.dart';

class CarPriceListWidget extends StatefulWidget {
  const CarPriceListWidget(
      {super.key, required this.state, required this.delegate});

  final CarListSuccessState state;
  final CarListDelegate delegate;

  @override
  State<CarPriceListWidget> createState() => _CarPriceListWidgetState();
}

class _CarPriceListWidgetState extends State<CarPriceListWidget> {
  List<CarPriceEntity> get _prices => widget.state.prices;
  List<CarEntity> get _cars => widget.state.cars;
  CarListDelegate get _delegate => widget.delegate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.verticalLarge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const IdentifyLargeWidget(),
          Expanded(
            child: Padding(
              padding: AppPadding.horizontalMedium,
              child: ListView.builder(
                itemCount: _prices.length,
                itemBuilder: (context, index) {
                  final price = _prices[index];

                  final car = _cars.firstWhere(
                    (car) => car.uid == price.car,
                  );

                  return CustomListTile(
                    car:
                        '${car.manufacturer.toUpperCase()} ${car.model.toUpperCase()} ${price.color.toUpperCase()}',
                    address:
                        '${price.address.city} - ${price.address.departament}',
                    price: price.price.toGuarani,
                    registeredAt: price.registeredAt.toHumanDate(),
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
                                '${car.manufacturer.toUpperCase()} ${car.model.toUpperCase()} ${price.color.toUpperCase()}',
                                style: AppTextStyles.listTileTitle,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                '${price.address.city} - ${price.address.departament}',
                                style: AppTextStyles.listTileSubtitle,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                price.carSaleType.name.translate(),
                                style: AppTextStyles.listTileSubtitle,
                              ),
                              Text(
                                price.gear.name.translate(),
                                style: AppTextStyles.listTileSubtitle,
                              ),
                              Text(
                                price.fuel.name.translate(),
                                style: AppTextStyles.listTileSubtitle,
                              ),
                              Text(
                                price.color,
                                style: AppTextStyles.listTileSubtitle,
                              ),
                              Text(
                                price.year,
                                style: AppTextStyles.listTileSubtitle,
                              ),
                              const SizedBox(
                                height: 20,
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
                    },
                  );
                },
              ),
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
    );
  }
}
