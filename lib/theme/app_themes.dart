//En esta clase se estaran definiendo los temas para la app

import 'package:flutter/material.dart';

class AppThemes {
  //En la variable primary se almacena elcolor global para el tema
  static const Color primary = Colors.red;
   //Primer tipo de tema de los 2 que podremos usar en esta app.
  static final lightTheme = ThemeData.light().copyWith(
    primaryColor: AppThemes.primary,
    androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
    //Tema global para los FloatingActionButton que se ocupen durante el codigo
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 0,
      backgroundColor: primary,
    ),
    //Tema global para los ProgressIndicator que se ocupen durante el codigo.
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primary,
    ),
    //Tema global par los ElevatedButton que se ocupen durante el codigo. 
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primary,
        shape: const StadiumBorder(),
        elevation: 0,
      ),
    ),
    //Tema para los InputDecoration que se ocuparan en el codigo
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primary),
      iconColor: primary,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      //Tema global para los FocusBorder
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    ),
  );

//Segundo tema global que se podra utilizar en esta app.
  static const Color primary2 = Colors.green;

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: AppThemes.primary2,
    androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      color: primary2,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 0,
      backgroundColor: primary2,
      foregroundColor: Colors.white,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primary2,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primary2,
        shape: const StadiumBorder(),
        elevation: 0,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primary2),
      iconColor: primary2,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary2),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    ),
  );
}
