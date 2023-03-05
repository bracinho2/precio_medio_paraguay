import 'package:precio_medio_paraguay/app/core/value_objects/value_object_interface.dart';

class CarManufacturer extends ValueObject<String> {
  CarManufacturer(super.value) {
    _validate();
  }

  void _validate() {
    if (value.isEmpty) {
      message = 'Informe o fabricante do Veículo';
    }
  }

  @override
  bool hasError() => message != null;

  @override
  String toString() {
    return 'Fabricante do veículo: $value';
  }
}
