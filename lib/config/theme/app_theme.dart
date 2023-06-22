import 'package:flutter/material.dart';

// Debes colocar el prefijo 0xFF
const Color _customColor = Color(
  0xFF5C11D4 //Color morado
);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];

class AppTheme {
  // Color que recibimos para controlar el tema 
  final int selectedColor;

  AppTheme({
    required this.selectedColor 
  }): assert( selectedColor >= 0 && selectedColor < _colorThemes.length - 1 , 'Colors must be between 0 and 6');

  // Retorna un ThemeData
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor]
    );
  }

}