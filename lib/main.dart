import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_bloc/app_view.dart';
import 'package:flutter_base_bloc/config/size.dart';
import 'package:flutter_base_bloc/presentation/blocs/bloc_observer.dart';
import 'package:flutter_base_bloc/presentation/blocs/common_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: CommonBloc.blocProviders,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              AppSize().init(constraints, orientation);
              return AppView();
            },
          );
        },
      ),
    );
  }
}
