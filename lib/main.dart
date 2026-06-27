import 'package:flutter/material.dart';
import 'package:test1/core/di/injection_container.dart';
import 'package:test1/core/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: '/signup',
    );
  }
}
