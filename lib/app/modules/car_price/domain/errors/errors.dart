import '../../../../core/errors/errors.dart';

class CarPriceError extends Failure {
  final StackTrace? stackTrace;
  final String? label;

  CarPriceError({
    super.message = 'CarPriceError',
    this.stackTrace,
    this.label,
  }) : super(
          stackTrace: stackTrace,
          label: label,
        );
}
