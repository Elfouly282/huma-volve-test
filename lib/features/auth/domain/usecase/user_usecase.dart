import 'package:dartz/dartz.dart';
import 'package:test1/core/error/failure.dart';
import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';
import '../../data/model/register_request_model.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(RegisterRequestModel request) {
    return repository.register(request);
  }
}
