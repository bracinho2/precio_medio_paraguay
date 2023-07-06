import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/errors/errors.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/repositories/get_all_departamentos_repository.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/infra/datasources/get_all_departamentos_datasource.dart';

import '../../dominio/entities/departamento_entity.dart';

import '../mappers/departamento_mapper.dart';

class GetAllDepartamentosRepositoryImpl
    implements GetAllDepartamentosRepository {
  final GetAllDepartamentosDatasource _getAllDepartamentosDatasource;
  GetAllDepartamentosRepositoryImpl(this._getAllDepartamentosDatasource);
  @override
  Future<Either<RegionError, List<DepartamentoEntity>>> call() async {
    try {
      final response = await _getAllDepartamentosDatasource.call();
      final departamentos = response
          .map((map) => DepartamentoMapper.fromMap(map: map))
          .toList()
        ..sort((a, b) => a.name.compareTo(b.name));

      return Right(departamentos);
    } on RegionError {
      return Left(GetAllDepartamentsError());
    } catch (e) {
      return Left(GetAllDepartamentsError());
    }
  }
}
