import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/auth_device_provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/core/domain/providers/home_provider.dart';
import 'package:solgis/core/presentation/widgets/initialized_widget.dart';
import 'package:solgis/core/routers/routers.dart';
import 'package:solgis/projects/cargo/domain/providers/registrar_form_cargo.dart';
import 'package:solgis/projects/people/data/services/movimiento_service.dart';
import 'package:solgis/projects/people/domain/providers/providers.dart';


class Appsol extends StatelessWidget {
  
  const Appsol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {  

    return MultiProvider(

      providers: [
        //PROVEEDOR DEL LOGIN.
        //PROVEEDOR DEL SOLAPP.
        //PROVEEDOR GENERAL.
        //PROVEEDOR DE DATOS.
        //PROVEEDOR DE INFORMACION DEL DISPOSITIVO
        ChangeNotifierProvider( create: (_) => AuthDeviceProvider()),
        ChangeNotifierProvider( create: (_) => HomeProvider() ),
        ChangeNotifierProvider( create: (_) => GlobalProvider() ),

        //PROVIDERS DEL PEOPLE
        ChangeNotifierProvider( create: (_) => NumPadProvider() ),
        ChangeNotifierProvider( create: (_) => RegistrarFormProvider() ),
        ChangeNotifierProvider( create: (_) => MovimientosProvider() ),
        ChangeNotifierProvider( create: (_) => MovimientosPageProvider() ),
        ChangeNotifierProvider( create: (_) => RadioListProvider() ),
        ChangeNotifierProvider( create: (_) => RadioProvider() ),
        ChangeNotifierProvider( create: (_) => ConsultaFormProvider() ),

        //PROVIDERS DEL CARGO
        ChangeNotifierProvider( create: (_) => RadioCargoProvider() ),

      ],

      child: const AppsolState(),

    );

  }

}

class AppsolState extends StatelessWidget {

  const AppsolState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'SOLAPP',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),

      // initialRoute : AppRoutes.initialRoute,
      home: const InitializedWidget(),
      routes: ProjectRoutes.getAppRoutes(),

    );

  }

}