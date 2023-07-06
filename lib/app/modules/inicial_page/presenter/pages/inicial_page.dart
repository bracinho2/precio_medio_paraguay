import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:precio_medio_paraguay/app/core/theme/app_padding.dart';
import 'package:precio_medio_paraguay/app/core/theme/colos_scheme.dart';
import 'package:precio_medio_paraguay/app/core/theme/text_styles.dart';
import 'package:precio_medio_paraguay/app/core/widgets/identify_large_widget.dart';
import 'package:precio_medio_paraguay/app/modules/inicial_page/presenter/delegate/initial_page_delegate.dart';

import '../../../../core/widgets/custom_background_widget.dart';
import '../widgets/initial_page_footer_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const IdentifyLargeWidget(),
            SelectMenuWidget(
              delegate: context.read(),
            ),
            FooterWidget(
              delegate: context.read(),
            )
          ],
        ),
      ),
    );
  }
}

class SelectMenuWidget extends StatelessWidget {
  const SelectMenuWidget({
    super.key,
    required this.delegate,
  });

  final InitialPageDelegate delegate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SelectMenuCardWidget(
          icon: Icons.car_crash,
          title: 'Vehicles',
          subtitle: 'Search Price',
          onTap: () {
            delegate.searchVehicles();
          },
        ),
        const SelectMenuCardWidget(
          icon: Icons.agriculture_outlined,
          title: 'Agro',
          subtitle: 'Coming Soon',
        ),
      ],
    );
  }
}

class SelectMenuCardWidget extends StatelessWidget {
  const SelectMenuCardWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: AppPadding.allSmall,
        child: Container(
          color: AppColors.accentColor,
          child: Padding(
            padding: AppPadding.allMedium,
            child: Column(
              children: [
                Icon(
                  icon,
                  color: AppColors.primaryColor,
                  size: 50,
                ),
                Text(
                  title,
                  style: AppTextStyles.selectMenuTitle,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: AppPadding.allSmall,
                  child: Text(
                    subtitle,
                    style: AppTextStyles.selectMenuSubtitle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
