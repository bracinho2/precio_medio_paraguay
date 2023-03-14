import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/modules/home_page/presenter/widgets/bottom_widget.dart';

import 'search_field_widget.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    this.initialValue,
    this.onChanged,
    this.onTap,
    required this.titleLabel,
    required this.buttomLabel,
    this.hintText,
  }) : super(key: key);

  final String titleLabel;
  final String buttomLabel;
  final String? hintText;
  final String? initialValue;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(20)),
      height: mediaQueryData.size.height * .4,
      width: mediaQueryData.size.width * .2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SearchFieldWidget(
            label: titleLabel,
            hintText: hintText,
            onChanged: onChanged,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: BottomWidget(
              label: buttomLabel,
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
