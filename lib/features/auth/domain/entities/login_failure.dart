enum LoginFailure {
  invalidCredentials,
  noInternet,
  sslHandshake,
  timeout,
  server,
  unexpected,
}

class LoginException implements Exception {
  const LoginException(this.failure);

  final LoginFailure failure;
}