import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/presenter/controller/search_page_controller.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/presenter/pages/search_filter_page.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/presenter/pages/search_sucess_page.dart';

import '../../../../core/theme/colos_scheme.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/custom_background_widget.dart';
import '../states/search_page_state.dart';

class SearchMainPage extends StatefulWidget {
  const SearchMainPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SearchPageController controller;

  @override
  State<SearchMainPage> createState() => _SearchMainPageState();
}

class _SearchMainPageState extends State<SearchMainPage> {
  SearchPageController get _controller => widget.controller;

  @override
  void initState() {
    _controller.fetchFilters();
    _controller.fetchExchangeNow();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundWidget(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 600,
            ),
            child: ValueListenableBuilder(
              valueListenable: _controller,
              builder: (context, state, _) {
                if (state is SearchPageLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.accentColor,
                    ),
                  );
                }

                if (state is SearchPageFilterResult) {
                  return SearchFilterPage(
                    controller: context.read(),
                    searchFilterEntity: state.filters,
                  );
                }

                if (state is SearchPageSucessState) {
                  return SearchSuccessPage(
                    result: state.result,
                    controller: context.read(),
                  );
                }

                if (state is SearchPageErrorState) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: AppTextStyles.formError,
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
