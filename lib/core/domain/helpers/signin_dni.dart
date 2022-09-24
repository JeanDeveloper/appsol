import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/data/services/signin_service.dart';
import 'package:solgis/core/device/preferences.dart';
import 'package:solgis/core/domain/helpers/get_relation_service.dart';
import 'package:solgis/core/domain/providers/home_provider.dart';
import 'package:solgis/core/domain/providers/person_auth_provider.dart';
import 'package:solgis/core/presentation/pages/home/home_page.dart';
import 'package:solgis/projects/people/domain/helpers/show_snackbar_awesome.dart';

Future<void>signinWithDNI(BuildContext context, String dni)async{
  final personProvider = Provider.of<PersonAuthProvider>(context, listen:false);
  final homeProvider = Provider.of<HomeProvider>(context, listen:false);
  homeProvider.isLoading = true;
  final signinService = SignInService();
  final singInService= await signinService.signInDNI(dni);

  if(singInService==null){
    homeProvider.isLoading = false;
    // ignore: use_build_context_synchronously
    return showSnackBarAwesome(context, 'Atencion', 'El DNI no corresponde a un agente o no existe', ContentType.failure);
  } 

  Preferences.codigoPersona = personProvider.codigoPersona = singInService.codigoPersonal!;
  Preferences.codigoUsuario = personProvider.codigoUsuario = singInService.codigoUsuario!;
  Preferences.dni           = personProvider.dni = singInService.dni!;
  Preferences.nombre        = personProvider.nombre = singInService.nombre!;
  Preferences.pApellido     = personProvider.pApellido = singInService.pApellido!;
  Preferences.sApellido     = personProvider.sApellido = singInService.sApellido!;
  Preferences.rol           = personProvider.rol = singInService.rol!;
  Preferences.codigoCliente = personProvider.codigoCliente = singInService.codigoCliente!;

  // ignore: use_build_context_synchronously
  await getRelation(context);
  Preferences.isAuthenticated = true;

  // ignore: use_build_context_synchronously
  openHomePage(context);

  homeProvider.controller.text = '';
  homeProvider.isLoading = false;
  homeProvider.isdragged = false;

}

  void openHomePage(BuildContext context) {
    
    final newRoute = PageRouteBuilder<dynamic>(
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: const HomePage(),
        );
      },
    );
    Navigator.pushAndRemoveUntil(context, newRoute, ModalRoute.withName(''));
  }