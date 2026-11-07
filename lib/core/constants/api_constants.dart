abstract class ApiConstants {
  ApiConstants._();

  static const String baseUrl =
      'https://jsonplaceholder.typicode.com';

  static const String users = '/users';

  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Duration sendTimeout = Duration(seconds: 15);
}