import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/auth_device_provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/core/domain/providers/home_provider.dart';
import 'package:solgis/core/domain/providers/person_auth_provider.dart';
import 'package:solgis/core/presentation/widgets/initialized_widget.dart';
import 'package:solgis/core/routers/routes.dart';

class Appsol extends StatelessWidget {
  
  const Appsol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //PROVEEDOR DEL LOGIN.
        //PROVEEDOR DEL SOLAPP.
        //PROVEEDOR DE INFORMACION DEL DISPOSITIVO
        ChangeNotifierProvider( create: (_) => AuthDeviceProvider()),
        ChangeNotifierProvider( create: (_) => HomeProvider() ),
        ChangeNotifierProvider( create: (_) => GlobalProvider() ),
        ChangeNotifierProvider( create: (_) => PersonAuthProvider() ),
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
        textTheme: GoogleFonts.aBeeZeeTextTheme()
      ),
      home: const InitializedWidget(),
      routes: SolAppRoutes.getAppRoutes(),

    );

  }

}