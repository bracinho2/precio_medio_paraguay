import '../../../../core/errors/errors.dart';

class ExchangeError extends Failure {
  final StackTrace? stackTrace;
  final String? label;

  ExchangeError({
    super.message = 'ExchangeError',
    this.stackTrace,
    this.label,
  }) : super(
          stackTrace: stackTrace,
          label: label,
        );
}
