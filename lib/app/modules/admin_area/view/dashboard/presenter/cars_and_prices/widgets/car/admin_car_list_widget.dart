// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/core/services/whatsapp/whatsapp.dart';
import 'package:precio_medio_paraguay/app/core/widgets/custom_alert_dialog.dart';
import 'package:precio_medio_paraguay/app/modules/admin_area/view/dashboard/presenter/cars_and_prices/controller/cars_and_prices_controller.dart';

import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';
import 'package:precio_medio_paraguay/app/modules/users/model/user_entity.dart';


import '../../../../../../../../core/services/google_maps/lauch_map_location.dart';
import '../../../../../../../../core/theme/app_padding.dart';
import '../../../../../../../../core/theme/colos_scheme.dart';
import '../../../../../../../../core/theme/text_styles.dart';
import 'admin_car_edit_dialog_widget.dart';

class AdminCarlistWidget extends StatelessWidget {
  const AdminCarlistWidget({
    Key? key,
    required this.cars,
    required this.users,
    required this.mapLocationService,
    required this.controller,
  }) : super(key: key);

  final List<CarEntity> cars;
  final List<UserEntity> users;
  final MapLocationService mapLocationService;
  final CarsAndPricesController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.rightSmall,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 5,
        ),
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          final user = users.firstWhere(
            (user) => user.uid == car.informedBy,
          );

          final lineColor = car.active;

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
                      color: AppColors.backgroundColor,
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
                              '${car.manufacturer.toUpperCase()} - ${car.model.toUpperCase()}',
                              style: AppTextStyles.listTileTitle,
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            WhatsAppMessage().sendMessage(
                                phone: user.phone, message: 'Hola que tal');
                          },
                          child: Text(
                            user.name,
                            style: AppTextStyles.listTileTitle,
                          ),
                        ),
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
                          onPressed: car.coordinates.latitude.isNotEmpty
                              ? () {
                                  mapLocationService.lauchMapOnBrowser(
                                      latitude: car.coordinates.latitude,
                                      longitude: car.coordinates.longitude);
                                }
                              : null,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.edit,
                          ),
                          color: AppColors.accentColor,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => CustomAlertDialog(
                                child: AdminCarEditDialogWidget(
                                  car: car,
                                  controller: context.read(),
                                  delegate: context.read(),
                                  snackBarManager: context.read(),
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          color: AppColors.accentColor,
                          onPressed: () {
                            controller.removeCar(uid: car.uid!);
                          },
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
