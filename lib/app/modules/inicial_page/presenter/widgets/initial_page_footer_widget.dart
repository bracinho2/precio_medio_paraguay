import 'package:flutter/material.dart';

import 'package:precio_medio_paraguay/app/core/theme/app_padding.dart';
import 'package:precio_medio_paraguay/app/core/theme/colos_scheme.dart';
import 'package:precio_medio_paraguay/app/core/theme/text_styles.dart';
import 'package:precio_medio_paraguay/app/modules/inicial_page/presenter/delegate/initial_page_delegate.dart';

class FooterWidget extends StatelessWidget {
  FooterWidget({
    super.key,
    required this.delegate,
  });

  final InitialPageDelegate delegate;
  final year = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FooterItemWidget(
          label: 'Ayuda',
          icon: Icons.help_center,
        ),
        FooterItemWidget(
          label: 'Anunciar',
          icon: Icons.storefront,
          onTap: () => delegate.goToUserAreaIfHasntLoggedUser(),
        ),
        const FooterItemWidget(
          label: 'Informar Error',
          icon: Icons.crisis_alert,
        ),
        GestureDetector(
          onLongPress: () {
            delegate.goToAdminAreaLogin();
          },
          child: Padding(
            padding: AppPadding.verticalLarge,
            child: Text(
              'Todo Paraguay ${year.year}',
              style: AppTextStyles.footerCopyRightText,
            ),
          ),
        ),
      ],
    );
  }
}

class FooterItemWidget extends StatelessWidget {
  const FooterItemWidget({
    Key? key,
    required this.label,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: AppTextStyles.footerLabel,
          ),
          Padding(
            padding: AppPadding.horizontalSmall,
            child: Icon(
              icon,
              color: AppColors.backgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
