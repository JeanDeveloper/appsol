import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/device/preferences.dart';
import 'package:solgis/core/domain/providers/home_provider.dart';
import 'package:solgis/core/domain/providers/person_auth_provider.dart';
import 'package:solgis/core/presentation/widgets/initialized_widget.dart';
import 'package:solgis/projects/people/domain/helpers/show_snackbar_awesome.dart';

Future<void>signOut(BuildContext context)async {

  final personProvider = Provider.of<PersonAuthProvider>(context, listen:false);
  final homeProvider   = Provider.of<HomeProvider>(context, listen:false);
  
  if(personProvider.codigoPersona != ''){
    homeProvider.isLoading = true;
    await Future.delayed(const Duration(seconds: 3));
    Preferences.codigoPersona = personProvider.codigoPersona = '';
    Preferences.codigoUsuario = personProvider.codigoUsuario = 0;
    Preferences.dni = personProvider.dni                     = '';
    Preferences.nombre = personProvider.nombre               = '';
    Preferences.pApellido = personProvider.pApellido         = '';
    Preferences.sApellido = personProvider.sApellido         = '';
    Preferences.rol = personProvider.rol                     = 0;
    Preferences.codigoCliente = personProvider.codigoCliente = '';
    showSnackBarAwesome(context, 'Atencion', 'Cerro Sesion Exitosamente', ContentType.success);
    openLoginPage(context);
    homeProvider.isLoading = false;
    Preferences.isAuthenticated = false;
  }else{

    print('fue logeado por usuario y contraseña');

  }

}

void openLoginPage(BuildContext context) {
  final newRoute = PageRouteBuilder<dynamic>(
    transitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (context, animation, secondaryAnimation) {
      return FadeTransition(
        opacity: animation,
        child: const InitializedWidget(),
      );
    },
  );
  Navigator.pushAndRemoveUntil(context, newRoute, ModalRoute.withName(''));

}