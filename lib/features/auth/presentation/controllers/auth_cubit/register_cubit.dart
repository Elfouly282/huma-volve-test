 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/features/auth/domain/use_cases/register_use_case.dart';
import 'package:test1/features/auth/presentation/controllers/auth_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase) : super(const RegisterInitial());

  Future<void> register({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(const RegisterLoading());

    final result = await registerUseCase(
      username: username,
      email: email,
      phone: phone,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );

    result.fold(
      (failure) => emit(RegisterFailureState(failure)),
      (user) => emit(RegisterSuccess(user)),
    );
  }
}