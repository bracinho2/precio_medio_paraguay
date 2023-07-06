import 'package:flutter/material.dart';

import '../theme/app_padding.dart';
import '../theme/colos_scheme.dart';
import '../theme/text_styles.dart';

class CustomMenuSelectOptionWidget extends StatelessWidget {
  const CustomMenuSelectOptionWidget({
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
          width: 150,
          color: AppColors.accentColor,
          child: Padding(
            padding: AppPadding.allMedium,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
