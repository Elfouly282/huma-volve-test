
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test1/core/constants/api_constants.dart';
import 'package:test1/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:test1/features/auth/data/repos/auth_repo_impl.dart';
import 'package:test1/features/auth/domain/repos/auth_repo.dart';
import 'package:test1/features/auth/domain/use_cases/register_use_case.dart';
import 'package:test1/features/auth/presentation/controllers/auth_cubit/register_cubit.dart';

final getIt = GetIt.instance;
 
Future<void> setupDependencyInjection() async {
  // ── Dio ───────────────────────────────────────────────────
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  getIt.registerLazySingleton<Dio>(() => dio);

  // ── Logger ────────────────────────────────────────────────
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
    ),
  );

  // ── Auth Data Source ──────────────────────────────────────
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt<Dio>()),
  );

  // ── Auth Repository ───────────────────────────────────────
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );

  // ── Auth Use Cases ────────────────────────────────────────
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<AuthRepository>()),
  );

  // ── Auth Cubits ───────────────────────────────────────────
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(getIt<RegisterUseCase>()),
  );
}
