enum LoginFailure {
  invalidCredentials,
  network,
  server,
  unexpected,
}

class LoginException implements Exception {
  const LoginException(this.failure);

  final LoginFailure failure;
}