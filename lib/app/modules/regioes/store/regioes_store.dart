import 'package:flutter/material.dart';
import 'package:precio_medio_paraguay/app/modules/regioes/dominio/entities/departamento_entity.dart';

import '../dominio/entities/municipio_entity.dart';

class RegioesStore {
  final departamentos = ValueNotifier<List<DepartamentoEntity>>([]);
  final municipios = ValueNotifier<List<MunicipioEntity>>([]);
}
