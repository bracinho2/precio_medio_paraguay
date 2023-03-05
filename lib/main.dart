import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/app_module.dart';
import 'package:precio_medio_paraguay/app/app_widget.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
