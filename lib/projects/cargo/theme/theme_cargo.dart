import 'package:flutter/material.dart';

class AppThemeCargo {

  static final ThemeData lighThemeCargo = ThemeData.light().copyWith(
    
    useMaterial3:true,
    primaryColor: const Color.fromARGB(249, 0, 2, 124),
    // unselectedWidgetColor:Colors.white,
    appBarTheme:  const AppBarTheme(
      backgroundColor: Color.fromARGB(249, 0, 2, 124),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
      centerTitle: true,
    ),

    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(Colors.white)
    ),

    // ESTILOS DE LOS TEXTOS
    textTheme: const TextTheme(

      headline1: TextStyle( 
        color: Colors.white,
        fontSize: 25
      ),

      headline2: TextStyle(
        color: Colors.white,
        fontSize: 22
      ),

      headline3: TextStyle(
        color: Colors.white,
        fontSize: 17
      ),

      headline4: TextStyle(
        fontSize: 14,
        color: Colors.white,
      )

    ),
    
    // ESTILOS DE LOS ICONOS
    primaryIconTheme: const  IconThemeData(
      color: Colors.white,
      size: 30
    ),

    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 30
    ),
  );

}
