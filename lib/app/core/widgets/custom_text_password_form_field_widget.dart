import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_padding.dart';
import '../theme/colos_scheme.dart';
import '../theme/text_styles.dart';

class CustomTextPasswordFormFieldWidget extends StatefulWidget {
  const CustomTextPasswordFormFieldWidget({
    super.key,
    required this.label,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.obscureText = false,
    this.inputFormatters,
    this.controller,
  });

  final String label;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;

  @override
  State<CustomTextPasswordFormFieldWidget> createState() =>
      _CustomTextPasswordFormFieldWidgetState();
}

class _CustomTextPasswordFormFieldWidgetState
    extends State<CustomTextPasswordFormFieldWidget> {
  TextStyle get _textStyle => AppTextStyles.textFieldSearchStyle;

  TextStyle get _errorStyle => AppTextStyles.formError;

  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          width: 3,
          color: AppColors.textFieldBorderColor,
        ),
      );

  bool showPassword = false;

  @override
  void initState() {
    showPassword = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      obscureText: showPassword,
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
      style: _textStyle,
      decoration: InputDecoration(
        label: Text(
          widget.label,
          style: _textStyle,
        ),
        suffixIcon: Padding(
          padding: AppPadding.rightSmall,
          child: InkWell(
            onTap: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            child: Icon(
              showPassword ? Icons.visibility : Icons.visibility_off,
              color: showPassword
                  ? AppColors.accentColor
                  : AppColors.backgroundColor,
            ),
          ),
        ),
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
