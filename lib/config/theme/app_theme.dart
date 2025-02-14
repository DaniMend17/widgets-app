import 'package:flutter/material.dart';

const List<Color> colorList = <Color>[
  Colors.blue,
  Colors.orange,
  Colors.green,
  Colors.red
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
      : assert(selectedColor >= 0 && selectedColor < colorList.length,
            'El color seleccionado debe estar en un rango de 0 y ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: colorList[selectedColor],
    brightness: isDarkMode? Brightness.dark : Brightness.light,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      // backgroundColor: colorList[selectedColor]
    )
  );

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode
  );

}
