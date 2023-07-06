import 'package:flutter/material.dart';

import '../../../../core/theme/colos_scheme.dart';
import '../../../../core/theme/text_styles.dart';

class CustomPriceTileIndicatorWidget extends StatelessWidget {
  const CustomPriceTileIndicatorWidget({
    super.key,
    required this.color,
    required this.legend,
  });

  final Color color;
  final String legend;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.backgroundColor,
        child: Icon(
          Icons.car_crash,
          color: color,
        ),
      ),
      title: Text(
        'Salto del Guairá - Canindeyú',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
      subtitle: Text(
        legend,
        style: AppTextStyles.listTileSubtitle,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text(
            'USD 2000',
            style: AppTextStyles.listTileUSD,
          ),
          Text(
            'G\$ 5.000.000',
            style: AppTextStyles.listTileGuarani,
          ),
        ],
      ),
    );
  }
}
