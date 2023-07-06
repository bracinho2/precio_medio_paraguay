import 'package:flutter/material.dart';

import '../theme/app_padding.dart';
import '../theme/colos_scheme.dart';

class CustomIconBackButtonWidget extends StatelessWidget {
  const CustomIconBackButtonWidget({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.allSmall,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors.accentColor,
      ),
      child: IconButton(
        color: AppColors.backgroundColor,
        onPressed: onPressed,
        icon: const Icon(
          Icons.arrow_back,
        ),
      ),
    );
  }
}
