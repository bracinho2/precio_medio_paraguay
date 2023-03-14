import '../../../../core/errors/errors.dart';

class DepartamentosError extends Failure {
  final StackTrace? stackTrace;
  final String? label;

  DepartamentosError({
    super.message = 'DepartamentosError',
    this.stackTrace,
    this.label,
  }) : super(
          stackTrace: stackTrace,
          label: label,
        );
}

class MunicipiosError extends Failure {
  final StackTrace? stackTrace;
  final String? label;

  MunicipiosError({
    super.message = 'MunicipiosError',
    this.stackTrace,
    this.label,
  }) : super(
          stackTrace: stackTrace,
          label: label,
        );
}
