import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/core/extensions/currency.dart';
import 'package:precio_medio_paraguay/app/core/widgets/custom_alert_dialog.dart';
import 'package:precio_medio_paraguay/app/modules/admin_area/view/dashboard/presenter/cars_and_prices/controller/cars_and_prices_controller.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/entities/car_price_entitity.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/entities/departamento_entity.dart';

import '../../../../../../../../core/services/google_maps/lauch_map_location.dart';
import '../../../../../../../../core/theme/app_padding.dart';
import '../../../../../../../../core/theme/colos_scheme.dart';
import '../../../../../../../../core/theme/text_styles.dart';
import 'admin_car_price_form_dialog_widget.dart';

class AdminCarPricelistWidget extends StatelessWidget {
  const AdminCarPricelistWidget({
    Key? key,
    required this.prices,
    required this.cars,
    required this.departaments,
    required this.mapLocationService,
    required this.controller,
  }) : super(key: key);

  final List<CarPriceEntity> prices;
  final List<CarEntity> cars;
  final List<DepartamentoEntity> departaments;
  final MapLocationService mapLocationService;
  final CarsAndPricesController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.leftSmall,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemCount: prices.length,
        itemBuilder: (context, index) {
          final price = prices[index];

          final car = cars.firstWhere(
            (element) => element.uid == price.car,
          );

          final lineColor = price.active;

          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: lineColor
                  ? AppColors.backgroundColor
                  : AppColors.listTileDisabled,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${car.manufacturer.toUpperCase()} ${car.model.toUpperCase()}',
                              style: AppTextStyles.listTileTitle,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  price.price.toGuarani,
                                  style: AppTextStyles.listTileTitle,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${price.address.city} - ${price.address.departament}',
                                  style: AppTextStyles.listTileSubtitle,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: AppPadding.rightSmall,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.map),
                          color: AppColors.accentColor,
                          onPressed: price.coordinates.latitude.isNotEmpty
                              ? () {
                                  mapLocationService.lauchMapOnBrowser(
                                      latitude: car.coordinates.latitude,
                                      longitude: car.coordinates.longitude);
                                }
                              : null,
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          color: AppColors.accentColor,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => CustomAlertDialog(
                                      maxHeight: 640,
                                      minWidth: 600,
                                      child: AdminCarPriceFormDialogWidget(
                                        cars: cars,
                                        departaments: departaments,
                                        carsAndPricesController: context.read(),
                                        delegate: context.read(),
                                        carPriceEntity: price,
                                      ),
                                    ));
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          color: AppColors.accentColor,
                          onPressed: () =>
                              controller.removeCarPrice(uid: price.uid!),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
