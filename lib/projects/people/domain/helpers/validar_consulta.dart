import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:solgis/projects/people/data/services/autorizacion_service.dart';
import 'package:solgis/projects/people/data/services/consulta_service.dart';
import 'package:solgis/projects/people/domain/models/autorizacion_model.dart';
import 'package:solgis/projects/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/projects/people/theme/theme.dart';

void validarConsulta(BuildContext context, String documento, String codServicio ) async {

  CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);
  progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppThemePeople.lighThemePeople.primaryColor)));
  progressDialog.show();

  ConsultaModel consulta = await ConsultaProvider().getConsulta(documento, codServicio);

  AutorizacionModel autorizacion = await AutorizacionService().getConsulta(codServicio, consulta.codigoPersona.toString(), consulta.tipoPersona![0].toString());

  progressDialog.dismiss();
  
  if(consulta.resultado == 'OK'){

    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, 'consulta_page_people', arguments: {
      'consulta':consulta,
      'autorizacion': autorizacion,
    });  
  }else{
    if(consulta.docPersona != null){
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, 'consulta_page_people', arguments: {
        'consulta': consulta,
        'autorizacion': autorizacion,
      });
    }else{
      // ignore: use_build_context_synchronously
      await NDialog(
        dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.white),
        title:  const Text("INFORMACION",  style: TextStyle(color: Colors.black)),
        content:  Text("El personal $documento \nno se encuentra en el sistema \nPor favor Registrelo", style: TextStyle(color: Colors.black)),  
        actions: <Widget>[
          TextButton(
            child: const Text("Ok"),
            onPressed: ()=> Navigator.pop(context)
          ),
        ],
      ).show(context);
    }
  }
}