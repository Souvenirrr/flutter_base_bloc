import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/config/size.dart';

class AppFonts {
  static final regular = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: AppSize.defaultSize * 1.4,
  );

  static final medium = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: AppSize.defaultSize * 1.4,
  );

  static final bold = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: AppSize.defaultSize * 1.4,
  );

  ///Singleton factory
  static final AppFonts _instance = AppFonts._internal();

  factory AppFonts() {
    return _instance;
  }

  AppFonts._internal();
}
