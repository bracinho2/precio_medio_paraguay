import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/domain/repositories/search_repository.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/domain/usecases/fetch_search_result_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/external/fetch_search_filter_datasource_impl.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/infra/datasources/fetch_search_filter_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/presenter/controller/search_page_controller.dart';

import 'domain/usecases/fetch_search_filter_usecase.dart';
import 'infra/repositories/search_repository.dart';

class SearchPageModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<ISearchDatasource>((i) => FetchSearchDatasource(i()),
            export: true),
        Bind.lazySingleton<ISearchRepository>((i) => SearchRepository(i()),
            export: true),
        Bind.lazySingleton<FetchSearchFilterUsecase>(
            (i) => FetchSearchFilter(i()),
            export: true),
        Bind.lazySingleton<FetchSearchResultUsecase>(
            (i) => FetchSearchResult(i()),
            export: true),
        Bind.singleton((i) => SearchPageController(i(), i()), export: true),
      ];
}
