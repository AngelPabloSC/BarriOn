// lib/theme/theme.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/f_constants.dart'; // Archivo donde defines tus colores y constantes
 const kErrorColor = Color(0xFFD32F2F);

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: F.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarThemeLight,
    iconTheme: IconThemeData(color: F.contentColorLight),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: F.tertiaryColor),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
      bodyColor: F.contentColorLight,
      fontFamily: 'visby',
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>((states) {
        if (states.contains(MaterialState.selected)) {
          return F.primaryColor;
        }
        return null;
      }),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: F.textButtonLight),
    ),
    cardTheme: const CardTheme(color: Color(0xFFF9F9F9)),
    dividerTheme: DividerThemeData(color: Colors.grey[350]),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>((states) {
        if (states.contains(MaterialState.selected)) {
          return F.secondaryColor;
        }
        return F.textButtonLight;
      }),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: F.primaryColor).copyWith(
      background: Colors.white,
      primary: F.primaryColor,
      secondary: F.secondaryColor,
      error: kErrorColor,
      onPrimary: Colors.black,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      unselectedItemColor: F.contentColorLight.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: F.primaryColor),
      showUnselectedLabels: true,
    ),
  );
}

// Definición del tema oscuro
ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: F.primaryColor,
    scaffoldBackgroundColor: F.contentColorLight,
    appBarTheme: appBarThemeDark,
    iconTheme: IconThemeData(color: F.contentColorDark),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: F.tertiaryColorDark),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
      bodyColor: F.contentColorDark,
      fontFamily: 'visby',
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>((states) {
        if (states.contains(MaterialState.selected)) {
          return F.tertiaryColor;
        }
        return null;
      }),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: F.textButtonDark),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: F.primaryColor,
      brightness: Brightness.dark,
    ).copyWith(
      primary: F.secondaryColor,
      secondary: F.primaryColor,
      error: kErrorColor,
      onPrimary: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: F.contentColorLight,
      unselectedItemColor: F.contentColorDark.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: F.tertiaryColor),
      showUnselectedLabels: true,
    ),
  );
}

// Definiciones de AppBarTheme
AppBarTheme appBarThemeLight = AppBarTheme(
  centerTitle: true,
  elevation: 0,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
  ),
  color: F.primaryColor,
);

AppBarTheme appBarThemeDark = AppBarTheme(
  centerTitle: true,
  elevation: 0,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ),
  color: F.contentColorLight,
);