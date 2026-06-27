import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test1/core/error/failure.dart';
import 'package:test1/features/auth/data/datasource/remote/remote_repository.dart';
import 'package:test1/features/auth/data/model/register_request_model.dart';
import 'package:test1/features/auth/domain/entity/register_entity.dart';
import 'package:test1/features/auth/domain/entity/user_entity.dart';
import 'package:test1/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> register(
    RegisterRequestEntity request,
  ) async {
    try {
      final response = await remoteDataSource.register(
        RegisterRequestModel(
          username: request.username,
          email: request.email,
          phone: request.phone,
          password: request.password,
          passwordConfirmation: request.passwordConfirmation,
          agreeTerms: request.agreeTerms,
        ),
      );

      return Right(
        UserEntity(
          id: response.user.id,
          username: response.user.username,
          email: response.user.email,
          phone: response.user.phone,
          createdAt: response.user.createdAt,
        ),
      );
    } on DioException catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }
}
