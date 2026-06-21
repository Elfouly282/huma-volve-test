import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:test1/features/auth/data/models/auth_model.dart';

abstract class RemoteDataSource {
  Future<AuthModel> post({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirm,
    required bool agree,
  });
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl({required this.dio}) {
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      },
    );
  }
  @override
  Future<AuthModel> post({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirm,
    required bool agree,
  }) async {
    final response = await dio.post(
      'https://grocery.newcinderella.online/api/auth/register',
      data: {
        'username': username,
        'email': email,
        'phone': phone,
        'password': password,
        'password_confirmation': passwordConfirm,
        'agree_terms': agree ? 1 : 0,
      },
      options: Options(
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    return AuthModel.fromJson(response.data);
  }
}
