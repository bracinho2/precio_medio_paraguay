import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/core/widgets/custom_background_widget.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/presenter/list/states/car_list_states.dart';

import 'controller/car_list_controller.dart';
import 'widgets/car_list_loading_widget.dart';
import 'widgets/car_list_widget.dart';

class CarListPage extends StatefulWidget {
  const CarListPage({
    super.key,
    required this.carListController,
  });

  final CarListController carListController;

  @override
  State<CarListPage> createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  CarListController get _controller => widget.carListController;
  @override
  void initState() {
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 600,
          ),
          child: ValueListenableBuilder(
            valueListenable: _controller,
            builder: (context, state, _) {
              if (state is CarListLoadingState) {
                return const CarListLoadingWidget();
              }

              if (state is CarListSuccessState) {
                return CarListWidget(
                  state: state,
                  delegate: context.read(),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
