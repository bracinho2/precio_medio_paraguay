import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/modules/home_page/presenter/widgets/bottom_widget.dart';
import 'package:precio_medio_paraguay/app/modules/home_page/presenter/widgets/menu_widget.dart';
import 'package:precio_medio_paraguay/app/modules/home_page/presenter/widgets/search_result_widget.dart';
import 'package:precio_medio_paraguay/app/modules/home_page/store/home_page_store.dart';

import 'widgets/background_map_widget.dart';

class SearchPageResult extends StatefulWidget {
  const SearchPageResult({super.key, required this.store});

  final HomePageStore store;

  @override
  State<SearchPageResult> createState() => _SearchPageResultState();
}

class _SearchPageResultState extends State<SearchPageResult> {
  @override
  void initState() {
    super.initState();
    widget.store.fetchCars();
  }

  HomePageStore get _store => widget.store;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundMapWidget(),
          Column(
            children: [
              const MenuWidget(),
              const Center(
                child: Text(
                  'Precio Medio',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'Paraguay',
                  style: TextStyle(
                    fontSize: 88.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SearchWidget(
                initialValue: _store.filterCarWordState.value,
                onChanged: (value) {
                  _store.filterCarWordState.value = value;
                },
              ),
              const BottomWidget(label: 'Buscar'),
              SearchResultWidget(
                store: context.read(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    this.initialValue,
    this.hintText,
    this.onChanged,
  });

  final String? initialValue;
  final String? hintText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      cursorColor: Colors.green,
      style: const TextStyle(
        color: Colors.green,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.green,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
      ),
    );
  }
}
