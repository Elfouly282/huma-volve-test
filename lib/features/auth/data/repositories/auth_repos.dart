import 'package:dartz/dartz.dart';
import 'package:test1/core/errors/failure.dart';
import 'package:test1/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepos {
  Future<Either<Failure,UserEntity>> register({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirm,
    required bool agree,
  });
}
