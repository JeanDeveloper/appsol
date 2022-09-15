import 'package:flutter/material.dart';


//ESTILOS DE LA PANTALLA DE BIENVENIDA DE LA PALABRA CARGO
TextStyle textstyleCargo( BuildContext context ) => TextStyle(
  color: Colors.white,
  fontSize: (MediaQuery.of(context).size.width/MediaQuery.of(context).size.width * 0.2)
);

//ESTILOS DE LA PANTALLA DE BIENVENIDA/ PALABRA: BIENVENIDOS.
TextStyle textstylewelcome(context ) => const  TextStyle(
  color: Colors.white,
  fontSize: 20
);

//ESTILOS DE LA LETRA DE LOS ICONOS
TextStyle textStyleLetter() => const TextStyle(
  color: Colors.white,
  fontSize: 12
);

//ESTILOS DE LA FECHA EN LA PANTALLA DE LISTADO DE MOVIMIENTOS
TextStyle textStyleDate() => const TextStyle(
  color:Colors.grey,
  fontSize: 20,
);

//ESTILOS DE LETRA DEL TITULO DEL TILES DE MOVIMIENTOS
TextStyle styleLetterpersonalmovimientotitle() => const TextStyle(
  color: Colors.black,
  fontSize: 12
);


//ESTILOS DE LETRA DEL SUBTITULO DE LOS TILES DE MOVIMIENTOS
TextStyle styleLetterpersonalmovimientosubtitle() => const TextStyle(
  color: Colors.grey,
  fontSize: 10
);


TextStyle styleLetter() => const TextStyle(
  color: Colors.white
);


TextStyle styleRadioTiles() => const TextStyle(
  fontSize: 10,
  color: Colors.white
);


TextStyle styleTituloMovimiento() => const  TextStyle(

  fontSize: 25,
  color: Colors.white,

);

TextStyle styleCrearPersonalTitulo() => const  TextStyle(

  fontSize: 20,
  color: Colors.white,

);


TextStyle styleCrearPersonaltextForm () => const TextStyle(
  fontSize: 14,
  color: Colors.blue,
);