import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff6200ee),
    primaryColorDark: const Color(0xff6200ee),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff6200ee),
    ));
