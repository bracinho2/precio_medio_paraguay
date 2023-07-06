import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:precio_medio_paraguay/app/core/screen/adaptative.dart';
import 'package:precio_medio_paraguay/app/core/theme/app_padding.dart';
import 'package:precio_medio_paraguay/app/core/theme/colos_scheme.dart';
import 'package:precio_medio_paraguay/app/core/theme/text_styles.dart';

import 'package:precio_medio_paraguay/app/core/widgets/custom_background_widget.dart';

import 'package:precio_medio_paraguay/app/modules/admin_area/view/dashboard/presenter/cars_and_prices/controller/cars_and_prices_controller.dart';

import 'package:precio_medio_paraguay/app/modules/admin_area/view/dashboard/presenter/cars_and_prices/widgets/car/admin_car_list_widget.dart';

import '../../../../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../../../../core/widgets/custom_loading_widget.dart';

import '../../../../delegate/admin_area_delegate.dart';
import '../../../../states/admin_area_page_states.dart';
import '../widgets/car/admin_car_register_dialog_widget.dart';
import '../widgets/prices/admin_car_price_form_dialog_widget.dart';
import '../widgets/prices/admin_car_price_list_widget.dart';

class CarsAndPricesPage extends StatefulWidget {
  const CarsAndPricesPage({
    Key? key,
    required this.controller,
    required this.delegate,
  }) : super(key: key);

  final CarsAndPricesController controller;
  final AdminAreaDelegate delegate;

  @override
  State<CarsAndPricesPage> createState() => _CarsAndPricesPageState();
}

class _CarsAndPricesPageState extends State<CarsAndPricesPage> {
  CarsAndPricesController get _controller => widget.controller;
  AdminAreaDelegate get _delegate => widget.delegate;

  @override
  void initState() {
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Padding(
        padding: AppPadding.horizontalLarge,
        child: ValueListenableBuilder<AdminPageState>(
          valueListenable: _controller,
          builder: (context, state, _) {
            if (state is AdminPageLoadingState) {
              return const CustomLoadingWidget();
            }

            if (state is AdminPageSuccessState) {
              return AdaptativeScreen(
                mobile: const Center(
                  child: Text(
                    'Coming Soon!',
                    style: AppTextStyles.alertDialogText,
                  ),
                ),
                desktop: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image:
                                    Image.asset('assets/dev_py_logo.png').image,
                              ),
                            ),
                          ),
                          Padding(
                            padding: AppPadding.rightLarge,
                            child: Row(
                              children: [
                                IconButton(
                                  iconSize: 40,
                                  icon: const Icon(
                                    Icons.car_crash,
                                    color: AppColors.accentColor,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => CustomAlertDialog(
                                        child: AdminCarRegisterDialogWidget(
                                          controller: context.read(),
                                          delegate: context.read(),
                                          snackBarManager: context.read(),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  iconSize: 40,
                                  icon: const Icon(
                                    Icons.price_change,
                                    color: AppColors.accentColor,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => CustomAlertDialog(
                                        maxHeight: 640,
                                        minWidth: 600,
                                        child: AdminCarPriceFormDialogWidget(
                                          cars: state.cars,
                                          departaments: state.departaments,
                                          carsAndPricesController:
                                              context.read(),
                                          delegate: context.read(),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  iconSize: 40,
                                  icon: const Icon(
                                    Icons.exit_to_app,
                                    color: AppColors.accentColor,
                                  ),
                                  onPressed: () {
                                    _delegate.goBack();
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: AdminCarlistWidget(
                              cars: state.cars,
                              users: state.users,
                              mapLocationService: context.read(),
                              controller: context.read(),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: AdminCarPricelistWidget(
                              cars: state.cars,
                              prices: state.prices,
                              departaments: state.departaments,
                              mapLocationService: context.read(),
                              controller: context.read(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: AppPadding.bottomMedium,
                      child: AdminDashboardFooter(
                        cars: '${state.cars.length}',
                        prices: '${state.prices.length}',
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class AdminDashboardFooter extends StatelessWidget {
  const AdminDashboardFooter({
    super.key,
    required this.cars,
    required this.prices,
  });

  final String cars;
  final String prices;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Total de Carros: $cars',
          style: AppTextStyles.buttomLabelWhite,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'Total de Preços: $prices',
          style: AppTextStyles.buttomLabelWhite,
        ),
      ],
    );
  }
}
