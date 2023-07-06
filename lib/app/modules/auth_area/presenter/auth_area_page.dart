import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/core/services/whatsapp/whatsapp.dart';

import 'package:precio_medio_paraguay/app/core/theme/app_padding.dart';
import 'package:precio_medio_paraguay/app/core/widgets/custom_background_widget.dart';
import 'package:precio_medio_paraguay/app/modules/auth_area/presenter/controller/auth_area_controller.dart';
import 'package:precio_medio_paraguay/app/modules/auth_area/presenter/delegate/auth_area_delegate.dart';
import 'package:precio_medio_paraguay/app/core/widgets/identify_large_widget.dart';

import '../../../core/widgets/custom_menu_select_option_widget.dart';

class AuthAreaPage extends StatefulWidget {
  const AuthAreaPage({
    super.key,
  });

  @override
  State<AuthAreaPage> createState() => _AuthAreaPageState();
}

class _AuthAreaPageState extends State<AuthAreaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundWidget(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: AppPadding.topLarge,
                child: IdentifyLargeWidget(),
              ),
              SelectMenuWidget(
                controller: context.read(),
                delegate: context.read(),
                messager: context.read(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectMenuWidget extends StatelessWidget {
  const SelectMenuWidget({
    Key? key,
    required this.controller,
    required this.delegate,
    required this.messager,
  }) : super(key: key);

  final AuthAreaController controller;
  final AuthAreaDelegate delegate;
  final AppMessager messager;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    int cards = 2;

    if (mediaQueryData.size.width <= 850) {
      cards = 2;
    } else {
      cards = 6;
    }

    return Padding(
      padding: AppPadding.horizontalMedium,
      child: GridView.count(
        crossAxisCount: cards,
        shrinkWrap: true,
        children: [
          CustomMenuSelectOptionWidget(
            icon: Icons.car_repair,
            title: 'Vehículo',
            subtitle: 'Informe um Vehiculo',
            onTap: () {
              delegate.registerCar();
            },
          ),
          CustomMenuSelectOptionWidget(
            icon: Icons.car_repair,
            title: 'Lista de Veiculos',
            subtitle: 'Veja seus informes',
            onTap: () {
              delegate.carList();
            },
          ),
          CustomMenuSelectOptionWidget(
            icon: Icons.car_repair,
            title: 'Preço',
            subtitle: 'Informe um Preço',
            onTap: () {
              delegate.registerPrice();
            },
          ),
          CustomMenuSelectOptionWidget(
            icon: Icons.car_repair,
            title: 'Lista de Preços',
            subtitle: 'Veja seus informes',
            onTap: () {
              delegate.priceList();
            },
          ),
          CustomMenuSelectOptionWidget(
            icon: Icons.person_2_sharp,
            title: 'Usuario',
            subtitle: 'Alterar Dados',
            onTap: () {
              delegate.goToUpdateUser();
            },
          ),
          CustomMenuSelectOptionWidget(
            icon: Icons.person_2_sharp,
            title: 'Pesquisar',
            subtitle: 'Área de Busca',
            onTap: () {
              delegate.goToSearchPage();
            },
          ),
          CustomMenuSelectOptionWidget(
            icon: Icons.message,
            title: 'Message',
            subtitle: 'Área de Busca',
            onTap: () {
              messager.welcomeMessage();
            },
          ),
          CustomMenuSelectOptionWidget(
            icon: Icons.person_2_sharp,
            title: 'Sair',
            subtitle: 'Sair do APP',
            onTap: () async {
              final status = await controller.logout();
              delegate.logout(status: status);
            },
          ),
        ],
      ),
    );
  }
}
