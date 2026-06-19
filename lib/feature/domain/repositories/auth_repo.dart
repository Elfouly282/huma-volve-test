import 'package:test1/core/utils/failure.dart';
import 'package:test1/feature/domain/entities/auth_entity.dart';

import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthEntity>> registerUser({
    required String name,
    required String email,
    required String password,
  });
}
