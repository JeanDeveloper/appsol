import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/home/domain/providers/global_provider.dart';
import 'package:solgis/people/domain/helpers/show_snackbar_awesome.dart';
import 'package:solgis/people/domain/providers/numpad_provider.dart';
import 'package:solgis/people/domain/helpers/consultar_doi_people.dart';
import 'package:solgis/people/domain/providers/radio_provider.dart';
import 'package:solgis/people/domain/providers/registrar_form_provider.dart';

getResultScanner(BuildContext context, String barcode){

  final numpadProvider = Provider.of<NumPadProvider>(context, listen: false);
  final loginProvider= Provider.of<GlobalProvider>(context, listen:false);
  final tipoProvider = Provider.of<RadioProvider>(context, listen:false);
  final registerForm = Provider.of<RegistrarFormProvider>(context, listen:false);

  if(barcode == '-1'){

    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,

      content: AwesomeSnackbarContent(
        title: '¡Alerta!',
        message:'Lo siento, no se ha recibido nada',
        contentType: ContentType.warning,
      ),
    );

    return ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }else{

    if(tipoProvider.valorTipoDocumento == 1){
      numpadProvider.dni = barcode;
      registerForm.dni = barcode;
      if(barcode == '' || barcode.length <8 ){
        showSnackBarAwesome(context, 'Error', 'Ingrese un dni valido', ContentType.failure);
      }else{
      Future.delayed(const Duration(seconds: 2));
      consultarDOI(context, barcode, loginProvider.codServicio);
      }

    }else if(tipoProvider.valorTipoDocumento == 2){
      numpadProvider.carnet = barcode;
      registerForm.carnetExtranjeria = barcode;
      if( barcode == '' || barcode.length<9 ){

        showSnackBarAwesome(context, 'Error', 'Ingrese un Carnet valido', ContentType.failure);
      }else{
        Future.delayed(const Duration(seconds: 2));
        consultarDOI(context, barcode, loginProvider.codServicio);
      }

    }else{
      registerForm.pasaporte = barcode;
      if( barcode.length>=9 && barcode.length<13){
        consultarDOI(context, barcode, loginProvider.codServicio);
      }else{
        showSnackBarAwesome(context, 'Error', 'Ingrese un Pasaporte valido', ContentType.failure);
      }

    }

  }

}
