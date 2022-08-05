import 'package:flutter/material.dart';
import 'package:solgis/cargo/presentation/pages/pages.dart';
import 'package:solgis/people/presentation/pages/pages.dart';
import 'package:solgis/home/presentation/pages/pages.dart';
import 'package:solgis/people/presentation/pages/salidas/salida_autorizada_page.dart';

class AppRoutes {

  static const initialRoute = 'home';
  
  static Map <String, Widget Function(BuildContext)> getAppRoutes(){

    Map <String, Widget Function(BuildContext)> appRoutes = {};
    
    appRoutes.addAll({
      
      // RAIZ GENERAL DE TODA LA APLICACION SOLAPP
      // 'welcome':(BuildContext context ) => const WelcomePage(),
      'home':   (BuildContext context ) => const HomePage(),

      //RUTA GENERAL PARA AL APP PEOPLE.
      'home_people'                 : (BuildContext context) => const HomePagePeople(),

      //RUTAS PARA LA APP PEOPLE
      'registrar_movimiento_people' : (BuildContext context) => const RegistrarMovimientoPage(),
      'ingreso_autorizado_people'   : (BuildContext context) => const IngresoAutorizadoPage(),
      'movimientos_page_people'     : (BuildContext context) => const MovimientosPage(),
      'crear_personal_page_people'  : (BuildContext context) => const CrearPersonalPage(),
      'consulta_home_page_people'   : (BuildContext context) => const ConsultaHomePage(),
      'salida_autorizada_people'    : (BuildContext context) => const SalidaAutorizadaPage(),
      'consulta_page_people'        : (BuildContext context) => const ConsultaPage(),
      'ingreso_denegado_people'     : (BuildContext context) => const IngresoDenegadoPage(),

      //RUTA GENERAL PARA AL APP CARGO.
      'home_cargo'                 : (BuildContext context) => const HomePageCargo(),
      'registrar_movimiento_cargo' : (BuildContext context) => const RegistrarPageCargo(),


      //RUTAS PARA EL APP CARGO
      // 'registrar_movimiento_people' : (BuildContext context) => const RegistrarMovimientoPage(),



    
    });
    
    return appRoutes;
  
  }


}