import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/core/theme/colos_scheme.dart';
import 'package:precio_medio_paraguay/app/core/theme/text_styles.dart';

class PriceIndicator extends StatelessWidget {
  const PriceIndicator({
    super.key,
    required this.title,
    required this.price,
    this.color = AppColors.priceIndicatorDefaultcolor,
  });

  final String title;
  final double price;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.price_change,
          ),
          Text(
            title,
            style: AppTextStyles.priceIndicatorTitle,
          ),
          Text(
            price.toString(),
            style: AppTextStyles.priceIndicatorValue,
          ),
        ],
      ),
    );
  }
}
