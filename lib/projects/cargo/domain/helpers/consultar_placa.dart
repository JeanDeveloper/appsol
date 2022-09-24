import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/cargo/domain/providers/registrar_form_cargo.dart';
import 'package:solgis/projects/cargo/theme/theme_cargo.dart';
import 'package:solgis/projects/people/domain/helpers/show_snackbar_awesome.dart';
// import 'package:solgis/projects/cargo/theme/theme_cargo.dart';

consultarPlaca(BuildContext context, String placa)async{
  
  final registroProvider = Provider.of<RegisterProvider>(context, listen: false);
  
  if(placa.trim().isEmpty || placa.trim().length < 6) return showSnackBarAwesome(context, 'Atencion', 'Por favor ingrese una placa valida', ContentType.failure);


  CustomProgressDialog progressDialog = CustomProgressDialog(
    context,
    loadingWidget: const Text('Cargando')
  );

  progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppThemeCargo.lighThemeCargo.primaryColor)));

  progressDialog.show();
  await Future.delayed(const Duration(seconds: 3));
  progressDialog.dismiss();

  // CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);
  // progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppThemeCargo.lighThemeCargo.primaryColor)));
  // progressDialog.show();
  // await Future.delayed( const Duration(seconds: 3)).showProgressDialog(context, title: const Text("This is just an ordinary loading"), message: Text("This is fastest and coolest way to show a dialog"));
  // progressDialog.dismiss();

  registroProvider.placa = '';

  // ignore: use_build_context_synchronously
  return Navigator.pushNamed(context, 'ingreso_autorizado_page_cargo');

}