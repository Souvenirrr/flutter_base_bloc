import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/config/application.dart';
import 'package:flutter_base_bloc/data/local/pref.dart';
import 'package:flutter_base_bloc/presentation/blocs/application_bloc/application_event.dart';
import 'package:flutter_base_bloc/presentation/blocs/application_bloc/application_state.dart';
import 'package:flutter_base_bloc/presentation/blocs/common_bloc.dart';
import 'package:flutter_base_bloc/presentation/blocs/language_bloc/language_event.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final Application application = Application();

  ApplicationBloc() : super(ApplicationInitial());

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    if (event is SetupApplication) {
      /// Setup SharedPreferences
      await application.setPreferences();

      /// Get old settings
      final oldLanguage = LocalPref.getString("language");

      if (oldLanguage != null) {
        CommonBloc.languageBloc.add(LanguageChanged(Locale(oldLanguage)));
      }

      /// Authentication begin check
      // CommonBloc.authencationBloc.add(AuthenticationnticationStarted());

      yield ApplicationCompleted();
    }
  }
}
