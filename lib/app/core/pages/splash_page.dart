import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../theme/colos_scheme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));
      Modular.to.navigate('/initial/');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.secundaryColor,
        ),
        child: Container(
          color: AppColors.blackColor.withOpacity(
            0.5,
          ),
          child: Center(
            child: Image.asset(
              'assets/dev_py_logo.png',
            ),
          ),
        ),
      ),
    );
  }
}
