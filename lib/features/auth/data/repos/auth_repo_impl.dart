import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test1/core/error/failure.dart';
import 'package:test1/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:test1/features/auth/domain/entities/user_entity.dart';
import 'package:test1/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> register({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final user = await remoteDataSource.register(
        username: username,
        email: email,
        phone: phone,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
      return Right(user);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
