import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/presentation/pages/login_page/login_screen.dart';
import 'package:flutter_base_bloc/presentation/pages/splash_page/splash_screen.dart';

class AppRouter {
  static const String SPLASH = '/splash';
  static const String LOGIN = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case LOGIN:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  ///Singleton factory
  static final AppRouter _instance = AppRouter._internal();

  factory AppRouter() {
    return _instance;
  }

  AppRouter._internal();
}
