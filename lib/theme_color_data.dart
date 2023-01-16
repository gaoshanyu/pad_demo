import 'package:flutter/material.dart';

class AppThemeData {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData = themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      primaryColor: colorScheme.primary,
      textTheme: textTheme,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFFC6D26),
    primaryContainer: Color(0xFF117378),
    secondary: Color(0xFF66696D),
    secondaryContainer: Color(0xFFFAFBFB),
    background: Color(0xFFF8F8FA),
    surface: Color(0xFFFAFBFB),
    onBackground: Color(0xFFF8F8FA),
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFC6D26),
    primaryContainer: Color(0xFF117378),
    secondary: Color(0xFF66696D),
    secondaryContainer: Color(0xFFFAFBFB),
    background: Color(0xFFF8F8FA),
    surface: Color(0xFFFAFBFB),
    onBackground: Color(0xFFF8F8FA),
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static const TextTheme textTheme = TextTheme(
    headlineMedium: TextStyle(fontWeight: _bold, fontSize: 20.0),
    headlineSmall: TextStyle(fontWeight: _medium, fontSize: 14.0),
    titleLarge: TextStyle(fontWeight: _semiBold, fontSize: 16.0),
    titleMedium: TextStyle(fontWeight: _medium, fontSize: 16.0),
    titleSmall: TextStyle(fontWeight: _medium, fontSize: 14.0),
    bodyLarge: TextStyle(fontWeight: _semiBold, fontSize: 16.0),
    bodyMedium: TextStyle(fontWeight: _regular, fontSize: 16.0),
    bodySmall: TextStyle(fontWeight: _regular, fontSize: 14.0),
    labelLarge: TextStyle(fontWeight: _semiBold, fontSize: 14.0),
    labelSmall: TextStyle(fontWeight: _medium, fontSize: 12.0),
  );
}
