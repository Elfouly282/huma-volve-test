import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test1/core/error/failure.dart';
import 'package:test1/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:test1/features/auth/data/models/register_request_model.dart';
import 'package:test1/features/auth/domain/entities/user_entity.dart';
import 'package:test1/features/auth/domain/repos/auth_repo.dart';
import 'package:test1/features/auth/domain/use_cases/register_params.dart';
 class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  const AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> register(RegisterParams params) async {
    try {
      final response = await _remoteDataSource.register(
        RegisterRequestModel(
          username: params.username,
          email: params.email,
          phone: params.phone,
          password: params.password,
          passwordConfirmation: params.passwordConfirmation,
        ),
      );
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure('Something went wrong, please try again'));
    }
  }
}


