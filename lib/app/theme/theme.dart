import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF0A171D);
  static const Color primary = Color(0xFF1E4045);
  static const Color textColor = Colors.white;
  static const Color textBodyColor = Color(0xFF8B9093);

  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color(0xFF62CDCB), Color(0xFF4498DA)],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: primary,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: textColor),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: textColor,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: textColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: textColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        bodySmall: TextStyle(color: Colors.white, fontSize: 14),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: textColor.withValues(alpha: 0.6)),
        labelStyle: const TextStyle(color: textColor),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 12.0,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
