import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/core/theme/colos_scheme.dart';
import 'package:precio_medio_paraguay/app/core/theme/text_styles.dart';

class CustomButtomWidget extends StatelessWidget {
  const CustomButtomWidget({
    super.key,
    required this.label,
    this.onTap,
  });

  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.accentColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              10.0,
            ),
          ),
        ),
        height: 48,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  label,
                  style: AppTextStyles.buttomLabelWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
