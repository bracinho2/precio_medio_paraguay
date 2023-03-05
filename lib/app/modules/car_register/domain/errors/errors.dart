import '../../../../core/errors/errors.dart';

class CarRegisterError extends Failure {
  final StackTrace? stackTrace;
  final String? label;

  CarRegisterError({
    super.message = 'CarRegisterError',
    this.stackTrace,
    this.label,
  }) : super(
          stackTrace: stackTrace,
          label: label,
        );
}
