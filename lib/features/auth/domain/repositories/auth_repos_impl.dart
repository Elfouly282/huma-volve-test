import 'package:dartz/dartz.dart';
import 'package:test1/core/errors/failure.dart';
import 'package:test1/features/auth/data/datasources/remote_data_source.dart';
import 'package:test1/features/auth/data/repositories/auth_repos.dart';
import 'package:test1/features/auth/domain/entities/user_entity.dart';

class AuthReposImpl extends AuthRepos {
  final RemoteDataSource remoteDataSource;

  AuthReposImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, UserEntity>> register({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirm,
    required bool agree,
  }) async {
    final response = await remoteDataSource.post(
      username: username,
      email: email,
      phone: phone,
      password: password,
      passwordConfirm: passwordConfirm,
      agree: agree,
    );
    if (!response.success) {
      return Left(Failure(message: response.message));
    } else {
      return Right(response.userModel!);
    }
  }
}
