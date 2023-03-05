import 'package:precio_medio_paraguay/app/core/errors/errors.dart';
import 'package:uno/uno.dart';

abstract class ApiBuilder {
  Future<ApiClientResponse> get({
    required String baseUrl,
  });
}

class ApiClientResponse {
  final dynamic data;
  final int statusCode;

  ApiClientResponse(this.statusCode, this.data);
}

class ClientHttpError extends Failure {
  ClientHttpError({
    StackTrace? stackTrace,
    required String message,
    required String label,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          label: label,
        );
}

class UnoApiProvider implements ApiBuilder {
  final Uno _uno;

  UnoApiProvider(this._uno);
  @override
  Future<ApiClientResponse> get({
    required String baseUrl,
  }) async {
    try {
      final response = await _uno.get(baseUrl);

      return ApiClientResponse(response.status, response.data);
    } on UnoError catch (e, s) {
      throw ClientHttpError(
        stackTrace: s,
        message: e.message,
        label: 'HttpClient Error',
      );
    }
  }
}
