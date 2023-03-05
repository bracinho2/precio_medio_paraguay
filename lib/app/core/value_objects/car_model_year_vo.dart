import 'package:precio_medio_paraguay/app/core/value_objects/value_object_interface.dart';

class CarModelYear extends ValueObject<String> {
  CarModelYear(super.value) {
    _validate();
  }

  void _validate() {
    if (value.isEmpty) {
      message = 'Informe Ano Modelo do Veículo';
    }
  }

  @override
  bool hasError() => message != null;

  @override
  String toString() {
    return 'Ano Modelo: $value';
  }
}
