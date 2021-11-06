import 'package:Airplay/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = true;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      buttonTheme: ButtonThemeData(
        buttonColor: Color.fromRGBO(2, 53, 60, 1),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: regular,
          fontSize: 14,
        ),
        bodyText1: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w800,
        ),
        subtitle1: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Color.fromRGBO(2, 53, 60, 1),
      scaffoldBackgroundColor: backgroundcolor2,
      buttonTheme: ButtonThemeData(
        buttonColor: Color.fromRGBO(2, 53, 60, 1),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        bodyText1: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        subtitle1: TextStyle(
          color: subMenuColor,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
