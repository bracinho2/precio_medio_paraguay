import 'package:flutter/material.dart';

import '../../../../../core/theme/colos_scheme.dart';

class CarLoadingFormWidget extends StatelessWidget {
  const CarLoadingFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.accentColor,
      ),
    );
  }
}
