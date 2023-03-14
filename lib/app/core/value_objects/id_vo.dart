import 'value_object_interface.dart';

class ID extends ValueObject<String> {
  ID(super.value) {
    _validate();
  }

  void _validate() {
    if (value.contains(value)) {
      message = 'Informe o ID';
    }
  }

  @override
  bool hasError() => message != null;

  @override
  String toString() {
    return 'ID $value';
  }
}
