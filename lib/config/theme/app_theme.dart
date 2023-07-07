import 'package:flutter/material.dart';

final List<Color> colorList = [
  Colors.blue,
  Colors.black,
  Colors.red,
  Colors.indigo,
  Colors.purple,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  }) : assert(selectedColor >= 0 && selectedColor < colorList.length,
            "Invalid color index");

  ThemeData getTheme({required bool isDarkMode}) {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
      ),
    );
  }
}
