import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test1/core/network/dio_client.dart';
import 'package:test1/features/auth/data/datasource/remote/remote_repository.dart';
import 'package:test1/features/auth/data/repository/auth_imple_repo.dart';
import 'package:test1/features/auth/domain/repository/auth_repository.dart';
import 'package:test1/features/auth/domain/usecase/user_usecase.dart';
import 'package:test1/features/auth/presntation/cubit/auth_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  // 1. Dio
  getIt.registerLazySingleton<Dio>(() => DioClient.create());

  // 2. DataSource
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt()),
  );

  // 3. Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );

  // 4. UseCase
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<AuthRepository>()),
  );

  // 5. Cubit
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<RegisterUseCase>()));
}
