import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../store/admin_store.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({
    super.key,
    required this.store,
  });

  final AdminStore store;

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  AdminStore get _store => widget.store;

  @override
  void initState() {
    super.initState();
    _store.getAllCarsAction();
  }

  @override
  Widget build(BuildContext context) {
    final cars = context.select(
      () => _store.carListState.value,
    );
    return Scaffold(
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final item = cars[index];
          final manufacturer = item.getManufacturer.value;
          final name = item.getName.value;
          final color = item.getColor.value;
          final saleType = item.getSaleType.value;

          final year = item.getModelYear.value;
          return ListTile(
            title: Text(
              '$manufacturer $name',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('Details: Color: $color; Sale Type: $saleType;'),
            leading: Text(year),
            trailing: SizedBox(
              width: 80,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      print('Edit');
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      print('Delete');
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
