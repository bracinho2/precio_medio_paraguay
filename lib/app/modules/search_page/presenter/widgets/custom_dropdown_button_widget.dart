import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/core/theme/text_styles.dart';

import '../../../../core/theme/colos_scheme.dart';

class CustomDropDownWidget<T> extends StatelessWidget {
  const CustomDropDownWidget({
    Key? key,
    required this.items,
    this.hintText,
    required this.onChanged,
    this.validator,
    this.value,
    this.active = false,
  }) : super(key: key);

  final List<DropdownMenuItem<T>> items;
  final String? hintText;
  final Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final T? value;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      focusColor: Colors.transparent,
      icon: Icon(
        Icons.arrow_downward_rounded,
        color: active
            ? AppColors.accentColor
            : AppColors.searchDropDownDisableColor,
      ),
      validator: validator,
      decoration: InputDecoration(
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        errorStyle: const TextStyle(
          color: AppColors.formErrorColor,
        ),
        fillColor: Colors.transparent,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: hintText,
        hintStyle: active
            ? AppTextStyles.dropdownbuttonEnabled
            : AppTextStyles.dropdownbuttonDisabled,
        contentPadding: const EdgeInsets.all(20),
      ),
      isExpanded: true,
      items: items,
      onChanged: onChanged,
    );
  }
}
