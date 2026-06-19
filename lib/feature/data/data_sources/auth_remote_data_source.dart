import 'package:dio/dio.dart';
import 'package:test1/core/utils/api_end_point.dart';
import '../model/register_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponseModel> register({
    required String name,
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<RegisterResponseModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await dio.post(
      ApiEndpoints.register,
      data: {"username": name, "email": email, "password": password},
    );

    return RegisterResponseModel.fromJson(response.data);
  }
}
