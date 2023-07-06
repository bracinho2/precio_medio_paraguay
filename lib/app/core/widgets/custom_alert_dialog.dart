import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/core/theme/colos_scheme.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    this.child,
    this.minHeight = 300,
    this.maxHeight = 700,
    this.minWidth = 300,
    this.maxWidth = 600,
  });

  final Widget? child;
  final double minHeight;
  final double maxHeight;
  final double minWidth;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: AppColors.secundaryColor.withOpacity(.4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      content: Builder(
        builder: (context) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: minHeight,
              maxHeight: maxHeight,
              minWidth: minWidth,
              maxWidth: maxWidth,
            ),
            child: child,
          );
        },
      ),
    );
  }
}
