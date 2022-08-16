import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:solgis/cargo/domain/providers/providers.dart';
import 'package:solgis/home/domain/providers/auth_device_provider.dart';
import 'package:solgis/home/domain/providers/global_provider.dart';
import 'package:solgis/home/domain/providers/home_provider.dart';
import 'package:solgis/home/presentation/widgets/widgets.dart';
import 'package:solgis/people/data/services/movimiento_service.dart';
import 'package:solgis/people/domain/providers/providers.dart';
import 'package:solgis/routers/routers.dart';


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
      routes: AppRoutes.getAppRoutes(),

    );

  }

}