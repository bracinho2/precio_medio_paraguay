import 'package:precio_medio_paraguay/app/core/value_objects/value_object_interface.dart';

class Date extends ValueObject<DateTime> {
  Date(super.value) {
    _validate();
  }

  void _validate() {
    if (value.isBefore(DateTime.now())) {
      message = 'Data Retroativa não é aceita';
    }
  }

  @override
  bool hasError() => message != null;

  @override
  String toString() {
    return value.toString();
  }
}
