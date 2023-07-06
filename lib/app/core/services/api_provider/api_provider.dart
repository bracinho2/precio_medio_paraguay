import 'package:dio/dio.dart';

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

abstract class ApiProviderError {}

class ClientHttpError extends ApiProviderError {
  ClientHttpError({
    StackTrace? stackTrace,
    required String message,
    required String label,
  });
}

class UnoApiProvider implements ApiBuilder {
  final Dio _uno;

  UnoApiProvider(this._uno);
  @override
  Future<ApiClientResponse> get({
    required String baseUrl,
  }) async {
    try {
      final response = await _uno.get(
        baseUrl,
      );

      return ApiClientResponse(response.hashCode, response.data);
    } on UnoError catch (e, s) {
      throw ClientHttpError(
        stackTrace: s,
        message: e.message,
        label: 'HttpClient Error',
      );
    }
  }
}
