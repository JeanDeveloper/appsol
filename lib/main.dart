// import 'package:flutter_device_identifier/flutter_device_identifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:solgis/cargo/domain/providers/providers.dart';
import 'package:solgis/home/domain/providers/device_information_provider.dart';
import 'package:solgis/home/domain/providers/global_provider.dart';
import 'package:solgis/home/domain/providers/login_provider.dart';
import 'package:solgis/people/data/services/movimiento_service.dart';
import 'package:solgis/people/domain/providers/providers.dart';
import 'package:solgis/routers/routers.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyAppState());
  // await FlutterDeviceIdentifier.requestPermission();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

}


class MyAppState extends StatelessWidget {
  
  const MyAppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    

    return MultiProvider(

      providers: [

        //PROVEEDOR DEL LOGIN.
        //PROVEEDOR DEL SOLAPP.
        //PROVEEDOR GENERAL.
        //PROVEEDOR DE DATOS.
        //PROVEEDOR DE INFORMACION DEL DISPOSITIVO
        ChangeNotifierProvider( create: (_) => GlobalProvider() ),
        ChangeNotifierProvider( create: (_) => DeviceInformationProvider() ),
        ChangeNotifierProvider( create: (_) => LoginProvider() ),
        
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

      child: const MyApp(),

    );

  }

}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'SOLAPP',
      routes: AppRoutes.getAppRoutes(),
      initialRoute : AppRoutes.initialRoute,

    );

  }

}