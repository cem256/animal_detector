import 'package:flutter/material.dart';

class AppTheme {
  final appTheme = ThemeData.dark().copyWith(
    typography: Typography.material2021(),
    focusColor: Colors.deepPurpleAccent,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
  );
}
