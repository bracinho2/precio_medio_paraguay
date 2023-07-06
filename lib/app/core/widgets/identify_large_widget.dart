import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/core/theme/app_padding.dart';

import '../theme/colos_scheme.dart';

class IdentifyLargeWidget extends StatelessWidget {
  const IdentifyLargeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: AppPadding.bottomLarge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Promedio',
            style: TextStyle(
                color: AppColors.accentColor,
                fontSize: mediaQueryData.size.width * .05 > 50
                    ? 50
                    : mediaQueryData.size.width * .05,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Paraguay',
            style: TextStyle(
                color: AppColors.accentColor,
                fontSize: mediaQueryData.size.width * .1 > 100
                    ? 100
                    : mediaQueryData.size.width * .1,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
