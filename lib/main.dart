import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/features/auth/data/datasources/remote_data_source.dart';
import 'package:test1/features/auth/domain/repositories/auth_repos_impl.dart';
import 'package:test1/features/auth/domain/usecases/register_use_case.dart';
import 'package:test1/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:test1/features/auth/presentation/cubit/auth_state.dart';
import 'package:test1/features/auth/presentation/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AuthCubit(
          AuthState(),
          registerUseCase: RegisterUseCase(
            repos: AuthReposImpl(
              remoteDataSource: RemoteDataSourceImpl(dio: Dio()),
            ),
          ),
        ),
        child: RegisterScreen(),
      ),
    );
  }
}
