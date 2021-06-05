import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/config/application.dart';
import 'package:flutter_base_bloc/config/language.dart';
import 'package:flutter_base_bloc/config/route.dart';
import 'package:flutter_base_bloc/presentation/blocs/application_bloc/application_bloc.dart';
import 'package:flutter_base_bloc/presentation/blocs/application_bloc/application_state.dart';
import 'package:flutter_base_bloc/presentation/blocs/common_bloc.dart';
import 'package:flutter_base_bloc/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:flutter_base_bloc/presentation/blocs/language_bloc/language_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'utils/translate.dart';

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get _navigator => _navigatorKey.currentState;

  @override
  void initState() {
    // CommonBloc.applicationBloc.add(SetupApplication());
    super.initState();
  }

  @override
  void dispose() {
    CommonBloc.dispose();
    super.dispose();
  }

  void onNavigate(String route) {
    _navigator!.pushNamedAndRemoveUntil(route, (route) => false);
  }

  void loadData() {}

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
      builder: (context, applicationState) {
        return BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            return MaterialApp(
              navigatorKey: _navigatorKey,
              debugShowCheckedModeBanner: Application.debug,
              title: Application.title,
              // theme: AppTheme.currentTheme,
              onGenerateRoute: AppRouter.generateRoute,
              initialRoute: AppRouter.SPLASH,
              locale: AppLanguage.defaultLanguage,
              supportedLocales: AppLanguage.supportLanguage,
              localizationsDelegates: [
                Translate.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              // builder: (context, child) {
              //   return BlocListener<AuthenticationBloc, AuthenticationState>(
              //     listener: (context, authState) {
              //       if (applicationState is ApplicationCompleted) {
              //         if (authState is Unauthenticated) {
              //           onNavigate(AppRouter.LOGIN);
              //         } else if (authState is Uninitialized) {
              //           onNavigate(AppRouter.SPLASH);
              //         } else if (authState is Authenticated) {
              //           loadData();
              //           onNavigate(AppRouter.HOME);
              //         }
              //       } else {
              //         onNavigate(AppRouter.SPLASH);
              //       }
              //     },
              //     child: child,
              //   );
              // },
            );
          },
        );
      },
    );
  }
}
