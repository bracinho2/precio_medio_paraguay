import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/core/widgets/custom_background_widget.dart';

import 'register/controller/car_controller.dart';
import 'register/states/car_page_state.dart';
import 'register/widgets/car_loading_form_widget.dart';
import 'register/widgets/car_register_form_widget.dart';

class RegisterCarPage extends StatefulWidget {
  const RegisterCarPage({super.key, required this.controller});

  final CarController controller;

  @override
  State<RegisterCarPage> createState() => _RegisterCarPageState();
}

class _RegisterCarPageState extends State<RegisterCarPage> {
  CarController get _controller => widget.controller;

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
              if (state is CarLoadingState) {
                return const CarLoadingFormWidget();
              }

              if (state is CarRegisterState) {
                return CarRegisterFormWidget(
                  controller: context.read(),
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
