import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/repositories/get_all_departamentos_repository.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/infra/datasources/get_all_departamentos_datasource.dart';

import '../../../../core/errors/errors.dart';
import '../../dominio/entities/departamento_entity.dart';
import '../../dominio/errors/errors.dart';
import '../mappers/departamento_mapper.dart';

class GetAllDepartamentosRepositoryImpl
    implements GetAllDepartamentosRepository {
  final GetAllDepartamentosDatasource _getAllDepartamentosDatasource;
  GetAllDepartamentosRepositoryImpl(this._getAllDepartamentosDatasource);
  @override
  Future<Either<Failure, List<DepartamentoEntity>>> call() async {
    try {
      final response = await _getAllDepartamentosDatasource.call();
      final departamentos =
          response.map((map) => DepartamentoMapper.fromMap(map: map)).toList();

      return Right(departamentos);
    } on Failure catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(
        DepartamentosError(
          message: e.toString(),
          stackTrace: s,
          label: 'Departamento Reposity Error',
        ),
      );
    }
  }
}
