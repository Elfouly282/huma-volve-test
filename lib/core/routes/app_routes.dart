import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/di/injection_container.dart';
import 'package:test1/features/auth/presntation/cubit/auth_cubit.dart';
import 'package:test1/features/auth/presntation/screen/login_screen.dart';
import 'package:test1/features/auth/presntation/screen/signup_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<AuthCubit>(),
            child: const SignUpScreen(),
          ),
        );

      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route Not Found'))),
        );
    }
  }
}
