import 'package:flutter/material.dart';
import 'package:solgis/projects/people/presentation/pages/pages.dart';
import 'package:solgis/projects/people/presentation/pages/salidas/salida_autorizada_page.dart';

class PeopleRoutes {

  static Map<String, WidgetBuilder> routes = {
    
    //RAIZ DEL PEOPLE
    "/": (context) => const HomePagePeople(),
    //RUTAS PARA LA APP PEOPLE
    'registrar_movimiento_people'    : (BuildContext context) => const RegistrarMovimientoPage(),
    'ingreso_autorizado_people'      : (BuildContext context) => const IngresoAutorizadoPage(),
    'salida_autorizada_people'       : (BuildContext context) => const SalidaAutorizadaPage(),
    'ingreso_denegado_people'        : (BuildContext context) => const IngresoDenegadoPage(),
    'movimientos_page_people'        : (BuildContext context) => const MovimientosPage(),
    'crear_personal_page_people'     : (BuildContext context) => const CrearPersonalPage(),
    'consulta_home_page_people'      : (BuildContext context) => const ConsultaHomePage(),
    'consulta_page_people'           : (BuildContext context) => const ConsultaPage(),
    'register_movimiento_gun_people' : (BuildContext context) => const RegisterScanGunPage(),
    'detalle_movimiento'             : (BuildContext context) =>       DetailMovimientoPage()

  };

}