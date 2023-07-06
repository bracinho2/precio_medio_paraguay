import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/core/theme/colos_scheme.dart';
import 'package:precio_medio_paraguay/app/core/theme/text_styles.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/domain/entities/search_result/search_result_entity.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/presenter/controller/search_page_controller.dart';

import '../../../../core/widgets/custom_alert_dialog.dart';
import '../../domain/entities/search_result/search_result_price_entity.dart';
import '../widgets/custom_price_tile_indicator_widget.dart';
import '../widgets/identify_small_widget.dart';

class SearchSuccessPage extends StatefulWidget {
  const SearchSuccessPage({
    Key? key,
    required this.result,
    required this.controller,
  }) : super(key: key);

  final SearchResultEntity result;
  final SearchPageController controller;

  @override
  State<SearchSuccessPage> createState() => _SearchSuccessPageState();
}

class _SearchSuccessPageState extends State<SearchSuccessPage> {
  SearchResultEntity get _result => widget.result;
  SearchPageController get _controller => widget.controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IdentifySmallWidget(
          onTap: () => _controller.searchAgain(),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Center(
            child: Text(
              '${_result.manufacturer} ${_result.model}',
              style: AppTextStyles.selectedVehicleResult,
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(.2),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: const [
                Text(
                  'Resume',
                  style: AppTextStyles.buttomLabelWhite,
                ),
                CustomPriceTileIndicatorWidget(
                  legend: 'minimum',
                  color: AppColors.minimumPrice,
                ),
                CustomPriceTileIndicatorWidget(
                  legend: 'medium',
                  color: AppColors.mediumPrice,
                ),
                CustomPriceTileIndicatorWidget(
                  legend: 'maximum',
                  color: AppColors.maximumPrice,
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 20,
          ),
          child: Text(
            'MORE PRICES',
            style: AppTextStyles.buttomLabelWhite,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: ListView.builder(
              itemCount: _result.prices.length,
              itemBuilder: (context, index) {
                final item = _result.prices[index];

                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: AppColors.backgroundColor,
                    child: Icon(
                      Icons.car_crash,
                      color: AppColors.accentColor,
                    ),
                  ),
                  title: Text(
                    '${_result.manufacturer} ${item.model}',
                    style: AppTextStyles.listTileTitle,
                  ),
                  subtitle: Text(
                    '${item.municipio} - ${item.departamento}',
                    style: AppTextStyles.listTileSubtitle,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'USD ${item.dolar}',
                        style: AppTextStyles.listTileUSD,
                      ),
                      Text(
                        'G\$ ${item.guarani}',
                        style: AppTextStyles.listTileGuarani,
                      ),
                    ],
                  ),
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomAlertDialog(
                          child: CarDetailAlertWidget(item: item),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CarDetailAlertWidget extends StatelessWidget {
  const CarDetailAlertWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final SearchResultPriceEntity item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.car_crash,
          color: AppColors.accentColor,
          size: 60,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          '${item.manufacturer} ${item.model}',
          style: AppTextStyles.vehicleDetailTitle,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Details',
          style: AppTextStyles.vehicleDetailSubtitle,
        ),
        Text(
          'Sale Type: ${item.saleType.value}',
          style: AppTextStyles.vehicleDetailInfo,
        ),
        Text(
          'Color: ${item.color}',
          style: AppTextStyles.vehicleDetailInfo,
        ),
        Text(
          'Fuel: ${item.fuel.name}',
          style: AppTextStyles.vehicleDetailInfo,
        ),
        Text(
          'Gear: ${item.gear.value}',
          style: AppTextStyles.vehicleDetailInfo,
        ),
        Text(
          'Year: ${item.year}',
          style: AppTextStyles.vehicleDetailInfo,
        ),
        Text(
          'Ondometer: ${item.ondometer}',
          style: AppTextStyles.vehicleDetailInfo,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Location',
          style: AppTextStyles.vehicleDetailSubtitle,
        ),
        Text(
          '${item.municipio} - ${item.departamento}',
          style: AppTextStyles.vehicleDetailInfo,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Contact',
          style: AppTextStyles.vehicleDetailSubtitle,
        ),
        Text(
          'Email: ${item.email}',
          style: AppTextStyles.vehicleDetailInfo,
        ),
        Text(
          'Phone: ${item.phone}',
          style: AppTextStyles.vehicleDetailInfo,
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          'informed by: ${item.informedBy}',
          style: AppTextStyles.vehicleDetailInfoSmall,
        ),
        Text(
          'published: ${item.anouncementDate}',
          style: AppTextStyles.vehicleDetailInfoSmall,
        ),
      ],
    );
  }
}
