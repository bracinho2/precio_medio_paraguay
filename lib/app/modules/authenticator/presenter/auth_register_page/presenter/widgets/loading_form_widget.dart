import 'package:flutter/material.dart';

import '../../../../../../core/theme/colos_scheme.dart';

class LoadingFormWidget extends StatelessWidget {
  const LoadingFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.accentColor,
      ),
    );
  }
}
