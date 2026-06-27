import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'dart:io';

class DioClient {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://grocery.newcinderella.online/api', // ← HTTPS مهم
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),

        followRedirects: true,
        maxRedirects: 5,
        validateStatus: (status) =>
            status != null && status < 500, // يقبل 301 و 302
      ),
    );
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
  

      final client = HttpClient();

      client.badCertificateCallback = (cert, host, port) => true;

      return client;
    };

    return dio;
  }
}
