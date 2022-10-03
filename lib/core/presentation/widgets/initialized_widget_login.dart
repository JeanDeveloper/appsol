import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/device/preferences.dart';
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

      authProvider.codigoPersonal    = Preferences.codigoPersonal;
      authProvider.dni               = Preferences.dni;
      authProvider.pNombre           = Preferences.pNombre;
      authProvider.sNombre           = Preferences.sNombre;
      authProvider.pApellido         = Preferences.pApellido;
      authProvider.sApellido         = Preferences.sApellido;
      authProvider.cargo             = Preferences.cargo;
      authProvider.codigoTipoUsuario = Preferences.codtipoUsuario;
      gProvider.codDispositivo       = Preferences.codDispositivo;
      gProvider.codServicio          = Preferences.codServicio;
      gProvider.codCliente           = Preferences.codCliente;
      gProvider.codSubArea           = Preferences.codSubArea;
      gProvider.nombreArea           = Preferences.nombreArea;
      gProvider.nombreSubArea        = Preferences.nombreSubArea;
      gProvider.nombreSucursal       = Preferences.nombreSucursal;
      gProvider.nombreCliente        = Preferences.nombreCliente;
      gProvider.aliasSede            = Preferences.aliasSede;
      gProvider.codTipoServicio      = Preferences.codTipoServicio;

    } 

    switch(authProvider.estado){
      case AuthStatus.Authenticated:
        return const HomePage();
      case AuthStatus.Unauthenticated:  
        return const LoginPage();
    }

  }
}

