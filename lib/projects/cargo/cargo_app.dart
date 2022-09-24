import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/cargo/domain/providers/movimientos_page_provider.dart';
import 'package:solgis/projects/cargo/domain/providers/registrar_form_cargo.dart';
import 'package:solgis/projects/cargo/routes/route.dart';

class CargoApp extends StatelessWidget{
  
  const CargoApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return MultiProvider(

      //PROVIDERS DEL CARGO
      providers:[
        ChangeNotifierProvider( create: (_) => RegisterProvider() ),
        ChangeNotifierProvider( create: (_) => MovimientosCargoPageProvider() )
      ],

      child: const CargoAppState(),

    );
  }

}

class CargoAppState extends StatelessWidget {
  const CargoAppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return MaterialApp(
        title: 'Cargo',
        debugShowCheckedModeBanner: false,
        routes: CargoRoutes.routes,
        initialRoute:  "/",
      );

  }

}
