import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/core/theme/colos_scheme.dart';

class CustomBackgroundWidget extends StatelessWidget {
  const CustomBackgroundWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.secundaryColor,
          image: DecorationImage(
            image: Image.asset('assets/mapa_paraguay.png').image,
          ),
        ),
        child: Container(
          color: AppColors.blackColor.withOpacity(
            0.5,
          ),
          child: child,
        ),
      ),
    );
  }
}
