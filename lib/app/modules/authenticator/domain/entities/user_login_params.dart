class UserLoginParams {
  final String email;
  final String password;
  UserLoginParams({
    required this.email,
    required this.password,
  });

  bool isValid() {
    return email.isEmpty && password.isEmpty;
  }
}
