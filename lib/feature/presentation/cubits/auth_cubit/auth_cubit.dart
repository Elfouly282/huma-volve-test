

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/feature/domain/use_cases/register_use_case.dart';
import 'package:test1/feature/presentation/cubits/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final RegisterUseCase registerUseCase;

  AuthCubit(this.registerUseCase) : super(AuthInitial());

  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    final result = await registerUseCase(
      name: name,
      email: email,
      password: password,
    );

    result.fold(
      (failure) {
        emit(AuthError(failure.message));
      },
      (success) {
        emit(AuthSuccess(success));
      },
    );
  }
}
