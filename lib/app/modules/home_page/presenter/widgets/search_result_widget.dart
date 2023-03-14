import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/modules/home_page/store/home_page_store.dart';
import 'package:rx_notifier/rx_notifier.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key, required this.store});

  final HomePageStore store;

  @override
  Widget build(BuildContext context) {
    final carros = context.select(
      () => store.filteredCarListState,
    );
    return ListView.builder(
      shrinkWrap: true,
      itemCount: carros.length,
      itemBuilder: (context, index) {
        final item = carros[index];
        final name = item.getName.value;
        final manufacturer = item.getManufacturer.value;
        final year = item.getModelYear.value;
        final gear = item.getGearType.value;
        final color = item.getColor.value;
        final saleType = item.getSaleType.value;

        return ListTile(
          title: Text(
            '$manufacturer $name',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text('$color $gear: $saleType'),
          leading: Text(year),
        );
      },
    );
  }
}
