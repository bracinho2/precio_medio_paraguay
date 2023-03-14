import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/repositories/get_all_departamentos_repository.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/repositories/get_all_municipios_repository.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/usecases/get_all_departamentos_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/usecases/get_all_municipios_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/usecases/get_departamento_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/external/get_all_departamentos_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/infra/datasources/get_all_departamentos_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/infra/repositories/get_all_departamentos_repository.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/infra/repositories/get_all_municipios_repository.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/store/regioes_store.dart';

import 'external/get_all_municipios_datasource.dart';
import 'infra/datasources/get_all_municipios_datasource.dart';

class RegioesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<GetAllDepartamentosDatasource>(
            (i) => GetAllDepartamentosDatasourceImpl(),
            export: true),
        Bind.lazySingleton<GetAllDepartamentosRepository>(
            (i) => GetAllDepartamentosRepositoryImpl(i()),
            export: true),
        Bind.lazySingleton<GetAllDepartamentosUsecase>(
            (i) => GetAllDepartamentos(i()),
            export: true),
        Bind.lazySingleton<GetDepartamentoUsecase>((i) => GetDepartamento(),
            export: true),
        Bind.lazySingleton<GetAllMunicipiosDatasource>(
            (i) => GetAllMunicipiosDatasourceImpl(),
            export: true),
        Bind.lazySingleton<GetAllMunicipiosRepository>(
            (i) => GetAllMunicipiosRepositoryImpl(i()),
            export: true),
        Bind.lazySingleton<GetAllMunicipiosUsecase>(
            (i) => GetAllMunicipios(i()),
            export: true),
        Bind.singleton((i) => RegioesStore(), export: true),
      ];
}
