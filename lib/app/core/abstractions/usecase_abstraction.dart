abstract class IUsecase<Output, Input> {
  Future<Output> call(Input params);
}

class NoParams {}

class Teste implements IUsecase<String, String> {
  @override
  Future<String> call(String params) {
    throw UnimplementedError();
  }
}
