
import 'package:test1/core/error/failure.dart';
import 'package:test1/features/auth/domain/entities/user_entity.dart';

abstract class RegisterState {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

class RegisterSuccess extends RegisterState {
  final UserEntity user;
  const RegisterSuccess(this.user);
}

class RegisterFailureState extends RegisterState {
  final Failure failure;
  const RegisterFailureState(this.failure);
}
