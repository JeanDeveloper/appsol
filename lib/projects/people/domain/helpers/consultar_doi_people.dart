import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';

import 'package:solgis/projects/people/data/services/consulta_doi_service.dart';
import 'package:solgis/projects/people/data/services/datos_acceso_movimiento_service.dart';
import 'package:solgis/projects/people/domain/helpers/show_snackbar_awesome.dart';
import 'package:solgis/projects/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/projects/people/domain/providers/numpad_provider.dart';
import 'package:solgis/projects/people/theme/theme.dart';

void consultarDOI(BuildContext context, String documento, String codServicio ) async {

  CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);
  final numpadProvider= Provider.of<NumPadProvider>(context, listen: false); 
  progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppThemePeople.lighThemePeople.primaryColor)));
  progressDialog.show();
  ConsultaModel consulta = await ConsultaDOIService().getConsulta(documento, codServicio);

  progressDialog.dismiss();

  if(consulta.resultado == 'OK'){

    if(consulta.tipoConsulta == 'INGRESO AUTORIZADO'){

      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, 'ingreso_autorizado_people', arguments:  consulta);

    }else {

      // ignore: use_build_context_synchronously
      if(consulta.codigoTipoPersona == null || consulta.codigoEmpresa == null || consulta.codigoCargo == null ) return showSnackBarAwesome(context, 'Atencion', 'Por favor regularize al personal', ContentType.warning);
      
      //OBTENGO LOS DATOS DE ACCESO DEL MOVIMIENTO DE ENTRADA.
      final datosAcceso = await DatosAccesoService().getDatosAccesosMovimiento(consulta.codigoServicio, consulta.codigoPersona!);


      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, 'salida_autorizada_people', arguments: {
        'consulta'    : consulta,
        'datos_acceso': datosAcceso,
      });

    }

    numpadProvider.dni = '';
    numpadProvider.carnet = '';

  }else{

    if(consulta.docPersona != null){

      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, 'ingreso_denegado_people', arguments: consulta);

    }else{

      // ignore: use_build_context_synchronously
      await NDialog(

        dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.white),
        title:  const Text("INFORMACION",  style: TextStyle(color: Colors.black)),
        content:  Text("El documento $documento no se encuentra en el sistema \n ¿Deseas registar al personal?", style: const TextStyle(color: Colors.black)),  

        actions: <Widget>[

          TextButton(
            child: const Text("Si"),
            onPressed: ()=>Navigator.pushReplacementNamed(context, 'crear_personal_page_people', arguments: documento),
          ),

          TextButton(
            child: const Text("No"),
            onPressed: ()=> Navigator.pop(context),
          ),

        ],

      ).show(context);

    }

  }
  

}
