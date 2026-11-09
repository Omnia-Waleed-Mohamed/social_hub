import 'package:dio/dio.dart';
import 'package:social_hub/core/constants/api_constants.dart';

class DioClient {
  DioClient()
      : dio = Dio(
          BaseOptions(
            baseUrl: ApiConstants.baseUrl,
            connectTimeout: ApiConstants.connectTimeout,
            receiveTimeout: ApiConstants.receiveTimeout,
            sendTimeout: ApiConstants.sendTimeout,
            responseType: ResponseType.json,
            contentType: Headers.jsonContentType,
            headers: const <String, String>{
              'Accept': 'application/json',
              'User-Agent': 'Mozilla/5.0 (Linux; Android 14; Mobile) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36',
            },
          ),
    );
  
  final Dio dio;
}