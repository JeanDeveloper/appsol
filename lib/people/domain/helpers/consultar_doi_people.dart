import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:solgis/people/data/services/consulta_doi_service.dart';
import 'package:solgis/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/theme/theme_people.dart';

void consultarDOI(BuildContext context, String documento, String codServicio ) async {

  CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);
  progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppThemePeople.lighThemePeople.primaryColor)));
  progressDialog.show();

  ConsultaModel consulta = await ConsultaDOIService().getConsulta(documento, codServicio);

  progressDialog.dismiss();
  
  if(consulta.resultado == 'OK'){
    
    if(consulta.tipoConsulta == 'INGRESO AUTORIZADO'){
      
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, 'ingreso_autorizado_people', arguments: consulta);

    }else {
      
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, 'salida_autorizada_people', arguments: consulta);
      
    }

  }else{
    
    if(consulta.docPersona != null){
      
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, 'ingreso_denegado_people', arguments: consulta);

    }else{

      // ignore: use_build_context_synchronously
      await NDialog(

        dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.white),
        title:  const Text("INFORMACION",  style: TextStyle(color: Colors.black)),
        content:  const Text("El personal no se encuentra en el sistema \n ¿Deseas registar al personal?", style: TextStyle(color: Colors.black)),  
        
        actions: <Widget>[

          TextButton(

            child: const Text("Si"),

            onPressed: ()=>Navigator.pushReplacementNamed(context, 'crear_personal_page_people', arguments: {
              "dni_persona" : documento,
              "cod_servicio" : codServicio,
            }), 

          ),

          TextButton(

            child: const Text("No"),
            onPressed: ()=> Navigator.pop(context)

          ),

        ],
      
      ).show(context);

    }

  }


}