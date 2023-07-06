import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:precio_medio_paraguay/app/core/theme/colos_scheme.dart';
import 'package:precio_medio_paraguay/app/core/theme/text_styles.dart';

class CustomPriceFormFieldWidget extends StatelessWidget {
  const CustomPriceFormFieldWidget({
    super.key,
    required this.label,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.obscureText = false,
    this.inputFormatters,
    this.controller,
    this.initialValue,
    this.readOnly = false,
    required this.prefix,
  });

  final String label;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? initialValue;
  final bool readOnly;
  final String prefix;

  TextStyle get _textStyle => AppTextStyles.textFieldSearchStyle;

  TextStyle get _errorStyle => AppTextStyles.formError;

  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          width: 3,
          color: AppColors.textFieldBorderColor,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      obscureText: obscureText,
      validator: validator,
      inputFormatters: inputFormatters,
      style: _textStyle,
      initialValue: initialValue,
      readOnly: readOnly,
      decoration: InputDecoration(
        prefix: Text(
          prefix,
          style: AppTextStyles.textFieldSearchStyle,
        ),
        label: Text(label, style: _textStyle),
        errorStyle: _errorStyle,
        enabledBorder: _border,
        disabledBorder: _border,
        focusedBorder: _border,
        errorBorder: _border,
        focusedErrorBorder: _border,
      ),
    );
  }
}
