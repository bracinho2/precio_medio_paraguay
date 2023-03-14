import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/repositories/get_all_municipios_repository.dart';

import '../../../../core/errors/errors.dart';
import '../entities/municipio_entity.dart';

abstract class GetAllMunicipiosUsecase {
  Future<Either<Failure, List<MunicipioEntity>>> call();
}

class GetAllMunicipios implements GetAllMunicipiosUsecase {
  final GetAllMunicipiosRepository _getAllMunicipiosRepository;

  GetAllMunicipios(this._getAllMunicipiosRepository);
  @override
  Future<Either<Failure, List<MunicipioEntity>>> call() async {
    return await _getAllMunicipiosRepository.call();
  }
}
