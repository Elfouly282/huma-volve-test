import 'package:dio/dio.dart';
import 'package:test1/core/constants/api_constants.dart';
import 'package:test1/features/auth/data/models/auth_response_model.dart';
import 'package:test1/features/auth/data/models/register_request_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> register(RegisterRequestModel request);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;

  const AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<AuthResponseModel> register(RegisterRequestModel request) async {
    final response = await _dio.post(
      ApiConstants.register,
      data: request.toJson(),
    );
    return AuthResponseModel.fromJson(response.data as Map<String, dynamic>);
  }
}
