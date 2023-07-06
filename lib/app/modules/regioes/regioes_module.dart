import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/repositories/get_all_departamentos_repository.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/usecases/get_all_departamentos_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/external/get_all_departamentos_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/infra/datasources/get_all_departamentos_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/infra/repositories/get_all_departamentos_repository.dart';

class RegioesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<GetAllDepartamentosDatasource>(
            (i) => GetAllDepartamentosDatasourceImpl(i()),
            export: true),
        Bind.lazySingleton<GetAllDepartamentosRepository>(
            (i) => GetAllDepartamentosRepositoryImpl(i()),
            export: true),
        Bind.lazySingleton<GetAllDepartamentUsecase>(
            (i) => GetAllDepartamentos(i()),
            export: true),
      ];
}
