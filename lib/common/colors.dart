import 'package:flutter/material.dart';

class AppColors {
  // example
  static const primaryColor = Color(0xFF3ac5c9);

  // example
  static const primaryGradientColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF25164d), Colors.white],
  );

  ///Singleton factory
  static final AppColors _instance = AppColors._internal();

  factory AppColors() {
    return _instance;
  }

  AppColors._internal();
}