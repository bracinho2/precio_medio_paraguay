import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/services/snackbar_manager/snackbar_manager.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Precio Medio Paraguay',
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      scaffoldMessengerKey: SnackBarManager.snackKey,
    );
  }
}
