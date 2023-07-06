import 'package:flutter/material.dart';

import '../theme/colos_scheme.dart';
import '../theme/text_styles.dart';

class CustomDropDownWidget<T> extends StatelessWidget {
  const CustomDropDownWidget({
    Key? key,
    required this.items,
    required this.label,
    required this.onChanged,
    this.validator,
    this.value,
    this.active = false,
  }) : super(key: key);

  final List<DropdownMenuItem<T>> items;
  final String label;
  final Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final T? value;
  final bool active;

  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          width: 3,
          color: AppColors.textFieldBorderColor,
        ),
      );

  TextStyle get _textStyle => AppTextStyles.textFieldSearchStyle;
  TextStyle get _errorStyle => AppTextStyles.formError;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      icon: const Visibility(visible: false, child: Icon(Icons.arrow_downward)),
      style: _textStyle,
      focusColor: Colors.transparent,
      validator: validator,
      decoration: InputDecoration(
        label: Text(label, style: _textStyle),
        enabledBorder: _border,
        focusedBorder: _border,
        errorBorder: _border,
        focusedErrorBorder: _border,
        errorStyle: _errorStyle,
      ),
      isExpanded: true,
      items: items,
      onChanged: onChanged,
    );
  }
}
