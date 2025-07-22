import 'package:flutter/material.dart';

/// Colores disponibles
enum ColorTheme {
  blue   (color: Colors.blue,),
  green  (color: Colors.green,),
  red    (color: Colors.red,),
  yellow (color: Colors.yellow,),
  orange (color: Colors.orange,),
  pink   (color: Colors.pink,),
  teal   (color: Colors.teal,),
  purple (color: Color(0xFF6200EA) ),
  custonPurple(color: Color(0xFF49149F) ),
  customRed   (color: Color.fromARGB(255, 158, 13, 13) );

  const ColorTheme({ 
    required Color color 
  }) : _color = color;

  final Color _color;
  Color get bgColor => _color;
}



class AppTheme{

  ///  Tema principal de la aplicación
  ///+ [themeColor]: Color base que utilizara la aplicación para definir el tema
  static ThemeData theme({ ColorTheme themeColor = ColorTheme.blue }) => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: themeColor.bgColor,
    brightness: Brightness.light
  );

  static getPrimaryColor( BuildContext context ) => Theme.of(context).colorScheme.primary;
  
  static getSecondaryColor( BuildContext context ) => Theme.of(context).colorScheme.secondary;
  
  static getAccentColor( BuildContext context ) => Theme.of(context).colorScheme.primary;
  
  static const Color background = Color(0xFF0E0B20);
  static const Color backgroundComponent = Color(0xFF1D1E33);
  static const Color backgroundComponentSelected = Color(0xFF4F548B);

}