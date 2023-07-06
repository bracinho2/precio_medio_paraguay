abstract class ValueObject<T> {
  ValueObject(this.value);

  final T value;

  bool hasError();
  String? message;
}
