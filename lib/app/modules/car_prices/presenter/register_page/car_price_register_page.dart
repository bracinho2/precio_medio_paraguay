import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:precio_medio_paraguay/app/modules/car_prices/presenter/register_page/controller/car_price_controller.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/presenter/register_page/states/car_price_states.dart';

import '../../../../core/widgets/custom_background_widget.dart';

import 'widgets/car_price_loading_widget.dart';
import 'widgets/car_price_register_form_widget.dart';

class CarPricePage extends StatefulWidget {
  const CarPricePage({
    Key? key,
    required this.carPriceController,
  }) : super(key: key);

  final CarPriceController carPriceController;

  @override
  State<CarPricePage> createState() => _CarPricePageState();
}

class _CarPricePageState extends State<CarPricePage> {
  CarPriceController get _controller => widget.carPriceController;

  @override
  void initState() {
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundWidget(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 600,
            ),
            child: ValueListenableBuilder(
              valueListenable: _controller,
              builder: (context, state, _) {
                if (state is CarPriceRegisterState) {
                  return CarPriceRegisterFormWidget(
                    state: state,
                    carPriceController: context.read(),
                    delegate: context.read(),
                  );
                }

                if (state is CarPriceLoadingState) {
                  return const CarPriceLoadingWidget();
                }

                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
