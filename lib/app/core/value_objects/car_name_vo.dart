import 'package:precio_medio_paraguay/app/core/value_objects/value_object_interface.dart';

class CarName extends ValueObject<String> {
  CarName(super.value) {
    _validate();
  }

  void _validate() {
    if (value.isEmpty) {
      message = 'Informe o nome do Veículo';
    }
  }

  @override
  bool hasError() => message != null;

  @override
  String toString() {
    return 'Nome do Veículo: $value';
  }
}
