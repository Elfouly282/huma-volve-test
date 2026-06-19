import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test1/core/utils/failure.dart';
import 'package:test1/feature/data/data_sources/auth_remote_data_source.dart';
import 'package:test1/feature/domain/entities/auth_entity.dart';
import 'package:test1/feature/domain/entities/user_entity.dart';
import 'package:test1/feature/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, AuthEntity>> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final result = await remoteDataSource.register(
        name: name,
        email: email,
        password: password,
      );

      final entity = AuthEntity(
        token: result.data.token,
        user: UserEntity(
          id: result.data.user.id,
          username: result.data.user.username,
          email: result.data.user.email,
          phone: result.data.user.phone,
          createdAt: result.data.user.createdAt,
        ),
      );

      return Right(entity);
    } 
    on DioException catch (e) {
      return Left(Failure(e.message ?? "Server error"));
    } catch (e) {
      return Left(Failure("Something went wrong"));
    }
  }
}
