import 'package:precio_medio_paraguay/app/core/value_objects/value_object_interface.dart';

class PriceUSD extends ValueObject<double> {
  PriceUSD(super.value) {
    _validate();
  }

  void _validate() {
    if (value < 0) {
      message = 'Informe o Preço do Veículo';
    }
  }

  @override
  bool hasError() => message != null;

  @override
  String toString() {
    return 'Preço do Veículo: $value';
  }
}
