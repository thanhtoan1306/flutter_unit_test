import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
      headlineLarge: const TextStyle().copyWith(fontWeight: FontWeight.w800),
      titleLarge: const TextStyle().copyWith(color: Colors.black, fontWeight: FontWeight.w600),
      labelLarge: const TextStyle().copyWith(fontWeight: FontWeight.w500),
      bodyLarge: const TextStyle().copyWith(fontWeight: FontWeight.w400));

  static TextTheme darkTextTheme = TextTheme(
      headlineLarge: const TextStyle().copyWith(fontWeight: FontWeight.w800),
      titleLarge: const TextStyle().copyWith(color: Colors.white, fontWeight: FontWeight.w600),
      labelLarge: const TextStyle().copyWith(fontWeight: FontWeight.w500),
      bodyLarge: const TextStyle().copyWith(fontWeight: FontWeight.w400));
}
