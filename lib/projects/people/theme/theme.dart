import 'package:flutter/material.dart';

class AppThemePeople {

  static final ThemeData lighThemePeople = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    // textTheme: GoogleFonts.montserratTextTheme(),
    useMaterial3:true,

    primaryColor: const Color(0xff031C36),

    // unselectedWidgetColor:Colors.white,


    //TIENE COLOR
    appBarTheme:  const AppBarTheme(
      backgroundColor: Color.fromARGB(249, 0, 2, 124),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
      centerTitle: true,
    ),

    //TIENE COLOR
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
        fontSize: 12
      )
    
    ),
    
    //ESTILOS DE LOS ICONOS
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
