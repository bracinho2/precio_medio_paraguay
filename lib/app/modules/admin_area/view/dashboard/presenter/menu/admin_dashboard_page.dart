import 'package:flutter/material.dart';

import 'package:precio_medio_paraguay/app/core/theme/app_padding.dart';
import 'package:precio_medio_paraguay/app/core/widgets/custom_background_widget.dart';

import 'package:precio_medio_paraguay/app/core/widgets/identify_large_widget.dart';
import 'package:precio_medio_paraguay/app/modules/admin_area/view/dashboard/presenter/menu/controller/admin_dashboard_controller.dart';
import 'package:precio_medio_paraguay/app/modules/admin_area/view/delegate/admin_area_delegate.dart';

import '../../../../../../core/widgets/custom_menu_select_option_widget.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({
    required this.controller,
    required this.delegate,
    super.key,
  });

  final AdminDashBoardController controller;
  final AdminAreaDelegate delegate;

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  AdminDashBoardController get _controller => widget.controller;
  AdminAreaDelegate get _delegate => widget.delegate;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    final menuList = [
      CustomMenuSelectOptionWidget(
        icon: Icons.car_repair,
        title: 'Veiculos & Preços',
        subtitle: 'Normalizar Veiculos e Preços',
        onTap: () {
          _delegate.carAndPrices();
        },
      ),
      CustomMenuSelectOptionWidget(
        icon: Icons.person,
        title: 'Usuários',
        subtitle: 'Dados dos Usuários',
        onTap: () {},
      ),
      CustomMenuSelectOptionWidget(
        icon: Icons.person,
        title: 'Usuários',
        subtitle: 'Dados dos Usuários',
        onTap: () {},
      ),
      CustomMenuSelectOptionWidget(
        icon: Icons.person,
        title: 'Usuários',
        subtitle: 'Dados dos Usuários',
        onTap: () {},
      ),
      CustomMenuSelectOptionWidget(
        icon: Icons.exit_to_app,
        title: 'Sair',
        subtitle: 'Faça o Logout Aqui',
        onTap: () {
          _controller.loggout();
          _delegate.signOut();
        },
      ),
    ];

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
              Padding(
                padding: AppPadding.horizontalMedium,
                child: GridView.count(
                  crossAxisCount:
                      mediaQueryData.size.width <= 850 ? 2 : menuList.length,
                  shrinkWrap: true,
                  children: menuList,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
