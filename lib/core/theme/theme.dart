import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
      );

  static final dartThemeMode = ThemeData.dark(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: AppPallete.backgroundColor,
      backgroundColor: AppPallete.backgroundColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(20),
      enabledBorder: border(),
      focusedBorder: border(AppPallete.gradient2),
      errorBorder: border(AppPallete.errorColor),
      border: border(),
    ),
    chipTheme: const ChipThemeData(
      side: BorderSide.none,
      color: MaterialStatePropertyAll(
        AppPallete.backgroundColor,
      ),
    ),
  );
}
