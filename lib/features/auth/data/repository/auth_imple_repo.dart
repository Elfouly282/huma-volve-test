import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test1/features/auth/data/datasource/remote/remote_repository.dart';
import 'package:test1/features/auth/domain/entity/user_entity.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/register_request_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> register(RegisterRequestModel request);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> register(
    RegisterRequestModel request,
  ) async {
    try {
      final response = await remoteDataSource.register(request);

      final user = UserEntity(
        id: response.user.id,
        username: response.user.username,
        email: response.user.email,
        phone: response.user.phone,
        createdAt: response.user.createdAt,
      );

      return Right(user);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? 'Error'));
    }
  }
}
