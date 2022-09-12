import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:solgis/projects/cargo/theme/theme_cargo.dart';
import 'package:solgis/projects/people/domain/helpers/show_snackbar_awesome.dart';

consultarPlaca(BuildContext context, String placa)async{

  if(placa.trim().isEmpty || placa.trim().length < 6) return showSnackBarAwesome(context, 'Atencion', 'Por favor ingrese una placa valida', ContentType.failure);

  CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);
  progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppThemeCargo.lighThemeCargo.primaryColor)));
  progressDialog.show();

  await Future.delayed(const Duration(seconds: 3));


  progressDialog.dismiss();

  return Navigator.pushNamed(context, 'ingreso_autorizado_page_cargo');

}