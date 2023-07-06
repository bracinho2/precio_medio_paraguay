import 'package:flutter/material.dart';

import '../theme/app_padding.dart';
import '../theme/colos_scheme.dart';
import '../theme/text_styles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.car,
    required this.address,
    required this.price,
    required this.registeredAt,
    this.onTap,
  });

  final String car;
  final String address;
  final String price;
  final String registeredAt;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: AppPadding.horizontalMedium,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  color: AppColors.accentColor,
                  width: 60,
                  height: 60,
                  child: const Icon(
                    Icons.car_crash,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        car,
                        style: AppTextStyles.listTileTitle,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        address,
                        style: AppTextStyles.listTileSubtitle,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: AppPadding.horizontalMedium,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        price,
                        style: AppTextStyles.listTileGuarani,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        registeredAt,
                        style: AppTextStyles.registeredAt,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
