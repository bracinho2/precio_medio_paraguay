extension StringToNumbers on String {
  String removeNonNumericCharacters() {
    final value = replaceAll(RegExp(r'[^0-9]'), '');
    if (value.isEmpty) {
      return '1970';
    }
    return value;
  }

  String removeNumericCharacteres() {
    final value = replaceAll(RegExp(r'[0-9]'), '');
    if (value.isEmpty) {
      return 'Cor indefinida';
    }
    return value;
  }
}
