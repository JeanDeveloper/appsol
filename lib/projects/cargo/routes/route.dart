import 'package:flutter/material.dart';
import 'package:solgis/projects/cargo/presentation/pages/pages.dart';

class CargoRoutes {

  static Map<String, WidgetBuilder> routes = {

    'home_cargo'                : (_) => const HomePageCargo(),
    'registrar_movimiento_cargo': (_) => const RegistrarPageCargo(),

  };

}
