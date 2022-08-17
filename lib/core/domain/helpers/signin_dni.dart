import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/data/services/signin_service.dart';
import 'package:solgis/core/domain/providers/person_auth_provider.dart';
import 'package:solgis/core/presentation/pages/home/home_page.dart';
import 'package:solgis/projects/people/domain/helpers/show_snackbar_awesome.dart';

Future<void>signinWithDNI(BuildContext context, String dni)async{
  final personProvider = Provider.of<PersonAuthProvider>(context, listen:false);

  final signinService = SignInService();

  final singInService= await signinService.signInDNI(dni);

  if(singInService==null) return showSnackBarAwesome(context, 'Atencion', 'No existe el personal', ContentType.failure);

  personProvider.codigoPersona = singInService.codigoPersonal!;
  personProvider.codigoUsuario = singInService.codigoUsuario!;
  personProvider.dni = singInService.dni!;
  personProvider.nombre = singInService.nombre!;
  personProvider.pApellido = singInService.pApellido!;
  personProvider.sApellido = singInService.sApellido!;
  personProvider.rol = singInService.rol!;
  personProvider.codigoCliente = singInService.codigoCliente!;
  openHomePage(context);


}

  void openHomePage(BuildContext context) {
    final newRoute = PageRouteBuilder<dynamic>(
      transitionDuration: const Duration(milliseconds: 1000),
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: const HomePage(),
        );
      },
    );
    Navigator.pushAndRemoveUntil(context, newRoute, ModalRoute.withName(''));
  }