import 'package:dio/dio.dart';
import 'package:test1/features/auth/data/model/register_request_model.dart';
import 'package:test1/features/auth/data/model/register_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponseModel> register(RegisterRequestModel request);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<RegisterResponseModel> register(RegisterRequestModel request) async {
    try {
      final response = await dio.post('/auth/register', data: request.toJson());

      return RegisterResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      final data = e.response?.data;

      if (data != null) {
        return RegisterResponseModel.fromJson(data);
      }

      throw Exception(e.message);
    }
  }
}
