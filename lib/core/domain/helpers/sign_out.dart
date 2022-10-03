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
  
  if(personProvider.codigoPersonal != ''){
    homeProvider.isLoading = true;
    await Future.delayed(const Duration(seconds: 3));
    Preferences.codigoPersonal = personProvider.codigoPersonal    = '';
    Preferences.dni            = personProvider.dni               = '';
    Preferences.pNombre        = personProvider.pNombre           = '';
    Preferences.sNombre        = personProvider.sNombre           = '';
    Preferences.pApellido      = personProvider.pApellido         = '';
    Preferences.sApellido      = personProvider.sApellido         = '';
    Preferences.cargo          = personProvider.cargo             = '';
    Preferences.codtipoUsuario = personProvider.codigoTipoUsuario = 0 ;

    // ignore: use_build_context_synchronously
    showSnackBarAwesome(context, 'Atencion', 'Cerro Sesion Exitosamente', ContentType.success);
    
    // ignore: use_build_context_synchronously
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