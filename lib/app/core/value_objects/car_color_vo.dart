import 'value_object_interface.dart';

class CarColor extends ValueObject<String> {
  CarColor(super.value) {
    _validate();
  }

  void _validate() {
    if (value.isEmpty) {
      message = 'Informe a cor do veículo';
    }
  }

  @override
  bool hasError() => message != null;

  @override
  String toString() {
    return 'Cor do Veículo: $value';
  }
}
