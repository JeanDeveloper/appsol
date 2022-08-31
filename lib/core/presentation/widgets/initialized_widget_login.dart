import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/device/preferences.dart';
import 'package:solgis/core/domain/helpers/signin_dni.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/core/domain/providers/person_auth_provider.dart';
import 'package:solgis/core/presentation/pages/pages.dart';

class InitializedWidgetAuth extends StatelessWidget{

  const InitializedWidgetAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<PersonAuthProvider>(context, listen: false);
    final gProvider = Provider.of<GlobalProvider>(context, listen: false);
    (Preferences.isAuthenticated)?authProvider.status = AuthStatus.Authenticated : authProvider.status = AuthStatus.Unauthenticated;

    if(Preferences.isAuthenticated){
      authProvider.codigoPersona = Preferences.codigoPersona;
      authProvider.codigoUsuario = Preferences.codigoUsuario;
      authProvider.dni = Preferences.dni;
      authProvider.nombre = Preferences.nombre;
      authProvider.pApellido = Preferences.pApellido;
      authProvider.sApellido = Preferences.sApellido;
      authProvider.rol = Preferences.rol;
      authProvider.codigoCliente = Preferences.codigoCliente;
      gProvider.codDispositivo = Preferences.codDispositivo;
      gProvider.codServicio = Preferences.codServicio;
      gProvider.codCliente = Preferences.codCliente;
      gProvider.codSubArea = Preferences.codSubArea;
      gProvider.nombreArea = Preferences.nombreArea;
      gProvider.nombreSubArea = Preferences.nombreSubArea;
      gProvider.nombreSucursal = Preferences.nombreSucursal;
      gProvider.nombreCliente = Preferences.nombreCliente;
      gProvider.aliasSede = Preferences.aliasSede;
      gProvider.codTipoServicio = Preferences.codTipoServicio;
    } 

    switch(authProvider.estado){
      
      case AuthStatus.Authenticated:
        return const HomePage();
        // return openHomePage(context)
      case AuthStatus.Unauthenticated:  
        return const LoginPage();
    }

  }
}

