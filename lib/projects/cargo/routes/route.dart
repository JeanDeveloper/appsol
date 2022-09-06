import 'package:flutter/material.dart';
import 'package:solgis/projects/cargo/presentation/pages/pages.dart';

class CargoRoutes {

  static Map<String, WidgetBuilder> routes = {

    //RAIZ DEL CARGO
    "/": (context) => const HomePageCargo(),
    
    //RUTAS PARA LA APP CARGO
    'registrar_movimiento_cargo': (_) => const RegistrarPageCargo(),

  };

}
