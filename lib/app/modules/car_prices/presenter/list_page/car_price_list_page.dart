import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/widgets/custom_background_widget.dart';
import 'controller/car_list_controller.dart';
import 'states/car_list_states.dart';
import 'widgets/car_price_list_widget.dart';

class CarPriceListPage extends StatefulWidget {
  const CarPriceListPage({
    Key? key,
    required this.carListController,
  }) : super(key: key);

  final CarListController carListController;

  @override
  State<CarPriceListPage> createState() => _CarPriceListPageState();
}

class _CarPriceListPageState extends State<CarPriceListPage> {
  CarListController get _controller => widget.carListController;

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
                if (state is CarListSuccessState) {
                  return CarPriceListWidget(
                    state: state,
                    delegate: context.read(),
                  );
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
