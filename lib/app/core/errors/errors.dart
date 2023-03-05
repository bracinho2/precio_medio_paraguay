abstract class Failure implements Exception {
  final String message;

  Failure({
    this.message = '',
    StackTrace? stackTrace,
    String? label,
  }) {
    if (stackTrace != null) {
      // print(label);
      // print(stackTrace);
    }
    //print('Passed in a main error');
  }
}
