import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/modules/home_page/presenter/widgets/background_map_widget.dart';
import 'package:precio_medio_paraguay/app/modules/home_page/presenter/widgets/menu_widget.dart';
import 'package:precio_medio_paraguay/app/modules/home_page/presenter/widgets/search_widget.dart';

import 'package:precio_medio_paraguay/app/modules/home_page/store/home_page_store.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.store,
  }) : super(key: key);

  final HomePageStore store;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.store.fetchCars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaginaPrincipal(
        store: widget.store,
      ),
    );
  }
}

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({
    Key? key,
    required this.store,
  }) : super(key: key);

  final HomePageStore store;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final filter = context.select(
      () => store.filterCarWordState.value,
    );

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundMapWidget(),
          const MenuWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Precio Medio',
                      style: TextStyle(
                          fontSize: mediaQueryData.size.height * .1,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Paraguay',
                      style: TextStyle(
                          fontSize: mediaQueryData.size.height * .2,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SearchWidget(
                  hintText: 'Digite para buscar',
                  titleLabel: 'Cual modelo usted busca?',
                  buttomLabel: 'Buscar',
                  onChanged: (value) {
                    store.filterCarWordState.value = value;
                  },
                  onTap: filter.isEmpty
                      ? null
                      : () {
                          Modular.to.pushNamed('/home/result/');
                        },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
