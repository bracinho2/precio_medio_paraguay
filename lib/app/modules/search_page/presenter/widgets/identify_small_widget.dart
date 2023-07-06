import 'package:flutter/material.dart';

import '../../../../core/theme/colos_scheme.dart';

class IdentifySmallWidget extends StatelessWidget {
  const IdentifySmallWidget({
    super.key,
    this.onTap,
  });

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.all(
        20,
      ),
      child: Stack(
        children: [
          InkWell(
            onTap: onTap,
            child: const Padding(
              padding: EdgeInsets.only(
                left: 20,
                top: 7,
              ),
              child: Icon(
                Icons.arrow_back,
                color: AppColors.backgroundColor,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Precio Medio',
                style: TextStyle(
                  color: AppColors.smallIdentify,
                  fontSize: mediaQueryData.size.width * .05 > 15
                      ? 15
                      : mediaQueryData.size.width * .05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Paraguay',
                style: TextStyle(
                    color: AppColors.smallIdentify,
                    fontSize: mediaQueryData.size.width * .1 > 30
                        ? 30
                        : mediaQueryData.size.width * .1,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
