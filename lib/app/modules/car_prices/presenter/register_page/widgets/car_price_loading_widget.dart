import 'package:flutter/material.dart';

import '../../../../../core/theme/colos_scheme.dart';

class CarPriceLoadingWidget extends StatelessWidget {
  const CarPriceLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.accentColor,
      ),
    );
  }
}
