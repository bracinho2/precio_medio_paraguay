import '../entities/municipio_entity.dart';

abstract class GetMunicipioUsecase {
  MunicipioEntity call(
      {required String municipioID, required List<MunicipioEntity> municipios});
}

class GetMunicipio implements GetMunicipioUsecase {
  @override
  MunicipioEntity call(
      {required String municipioID,
      required List<MunicipioEntity> municipios}) {
    final municipio =
        municipios.firstWhere((municipio) => municipio.id == municipioID);
    return municipio;
  }
}
