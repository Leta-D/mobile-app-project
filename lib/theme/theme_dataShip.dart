import 'package:flutter/material.dart';

Color mainGreenGenerator(double opacity) => Color.fromRGBO(139, 227, 7, opacity);
Color secondGreenGenerator(double opacity) => Color.fromRGBO(150, 207, 123, opacity);
Color mainWhiteGenerator(double opacity) => Color.fromRGBO(255, 255, 255, opacity);
Color mainBlackGenerator(double opacity) => Color.fromRGBO(0, 0, 0, opacity);
Color secondBlackGenerator(double opacity) => Color.fromRGBO(25, 25, 25, opacity);
Color mainGreyGenerator(double opacity) => Color.fromRGBO(91, 91, 91, opacity);

int data =3;
Gradient backgroundGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    mainBlackGenerator(0.9),
    mainBlackGenerator(0.5),
    mainBlackGenerator(0.9),
  ],
);
ThemeData themeDataBoot = ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    hintFadeDuration: Duration(milliseconds: 500),
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: mainGreenGenerator(1)),
    ),
  ),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.all(mainGreenGenerator(1)),
    overlayColor: WidgetStateProperty.all(mainBlackGenerator(0.6)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(mainGreenGenerator(1)),
    )
  ),

);