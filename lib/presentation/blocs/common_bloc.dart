import 'package:flutter_base_bloc/presentation/blocs/application_bloc/application_bloc.dart';
import 'package:flutter_base_bloc/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonBloc {
  /// Bloc
  static final applicationBloc = ApplicationBloc();
  static final languageBloc = LanguageBloc();

  static final List<BlocProvider> blocProviders = [
    BlocProvider<ApplicationBloc>(
      create: (context) => applicationBloc,
    ),
    BlocProvider<LanguageBloc>(
      create: (context) => languageBloc,
    ),
  ];

  /// Dispose
  static void dispose() {}

  /// Singleton factory
  static final CommonBloc _instance = CommonBloc._internal();

  factory CommonBloc() {
    return _instance;
  }

  CommonBloc._internal();
}
