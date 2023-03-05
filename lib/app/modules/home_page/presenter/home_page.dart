import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/domain/entities/exchange_entity.dart';
import 'package:precio_medio_paraguay/app/modules/exchanges/store/exchange_store.dart';
import 'package:precio_medio_paraguay/app/modules/home_page/controller/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.controller,
    required this.store,
  });

  final HomePageController controller;
  final ExchangeStore store;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.controller.getExchange();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: ValueListenableBuilder<List<ExchangeEntity>>(
        valueListenable: widget.store.exchanges,
        builder: (context, list, _) => ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final exchange = list[index];

            return Text(exchange.toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.controller.getExchange();
        },
      ),
    );
  }
}
