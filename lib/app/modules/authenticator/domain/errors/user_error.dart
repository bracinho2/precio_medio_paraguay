abstract class AuthenticatorError {}

class InvalidUser extends AuthenticatorError {}

class UserUidNotSet extends AuthenticatorError {}

class NotFoundUser extends AuthenticatorError {}

class NothingChangedUser extends AuthenticatorError {}

class InvalidEmail extends AuthenticatorError {}

class CantSearchUserById extends AuthenticatorError {}

class CantRegisterUser extends AuthenticatorError {}

class CantUpdateUser extends AuthenticatorError {}

class SomethingWrong extends AuthenticatorError {}

class DatasourceError extends AuthenticatorError {}

class ParseError extends AuthenticatorError {}

class CantLoginUser extends AuthenticatorError {}

class InvalidLoginParams extends AuthenticatorError {}

