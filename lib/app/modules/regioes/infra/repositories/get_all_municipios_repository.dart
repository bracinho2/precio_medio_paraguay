// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/entities/municipio_entity.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/infra/datasources/get_all_municipios_datasource.dart';

import '../../../../core/errors/errors.dart';
import '../../dominio/errors/errors.dart';
import '../../dominio/repositories/get_all_municipios_repository.dart';
import '../mappers/municipio_mapper.dart';

class GetAllMunicipiosRepositoryImpl implements GetAllMunicipiosRepository {
  final GetAllMunicipiosDatasource _getAllMunicipiosDatasource;
  GetAllMunicipiosRepositoryImpl(
    this._getAllMunicipiosDatasource,
  );
  @override
  Future<Either<Failure, List<MunicipioEntity>>> call() async {
    try {
      final response = await _getAllMunicipiosDatasource.call();
      final municipios =
          response.map((map) => MunicipioMapper.fromMap(map: map)).toList();

      return Right(municipios);
    } on Failure catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(
        MunicipiosError(
          message: e.toString(),
          stackTrace: s,
          label: 'Municipios Reposity Error',
        ),
      );
    }
  }
}
