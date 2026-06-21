import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/features/auth/domain/usecases/register_use_case.dart';
import 'package:test1/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(super.initialState, {required this.registerUseCase});
  final RegisterUseCase registerUseCase;
  Future<void> register({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirm,
    required bool agree,
  }) async {
    emit(AuthLoading());
    final result = await registerUseCase.call(
      username: username,
      email: email,
      phone: phone,
      password: password,
      passwordConfirm: passwordConfirm,
      agree: agree,
    );
    result.fold(
      (fail) => emit(AuthError(message: fail.message)),
      (data) => emit(AuthLoaded(entity: data)),
    );
  }
}
