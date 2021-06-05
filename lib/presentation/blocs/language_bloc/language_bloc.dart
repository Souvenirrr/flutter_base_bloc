import 'package:flutter_base_bloc/config/language.dart';
import 'package:flutter_base_bloc/data/local/pref.dart';
import 'package:flutter_base_bloc/presentation/blocs/language_bloc/language_event.dart';
import 'package:flutter_base_bloc/presentation/blocs/language_bloc/language_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(InitialLanguageState());

  @override
  Stream<LanguageState> mapEventToState(event) async* {
    if (event is LanguageChanged) {
      if (event.locale == AppLanguage.defaultLanguage) {
        yield LanguageUpdated();
      } else {
        yield LanguageUpdating();
        AppLanguage.defaultLanguage = event.locale;
        await LocalPref.setString("language", event.locale.languageCode);
        yield LanguageUpdated();
      }
    }
  }
}
