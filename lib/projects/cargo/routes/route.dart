import 'package:solgis/projects/cargo/presentation/pages/pages.dart';
import 'package:flutter/material.dart';

class CargoRoutes {

  static Map<String, WidgetBuilder> routes = {

    //RAIZ DEL CARGO
    "/": (context) => const HomePageCargo(),
    
    //RUTAS PARA LA APP CARGO
    'registrar_movimiento_cargo': (_) => const RegistrarPageCargo(),
    'movimientos_page_cargo'    : (_) => const MovimientosPageCargo(),
    'ingreso_autorizado_page_cargo'   : (_) => const IngresoAutorizadoCargoPage(),

  };

}
