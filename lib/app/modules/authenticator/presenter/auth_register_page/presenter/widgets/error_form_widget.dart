import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/core/widgets/custom_buttom_widget.dart';
import 'package:precio_medio_paraguay/app/modules/auth_area/presenter/delegate/auth_area_delegate.dart';

class ErrorFormWidget extends StatelessWidget {
  const ErrorFormWidget({
    super.key,
    required this.message,
    required this.delegate,
  });

  final String message;
  final AuthAreaDelegate delegate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(message),
        CustomButtomWidget(
          label: 'Voltar',
          onTap: () {
            delegate.initial();
          },
        )
      ],
    );
  }
}
