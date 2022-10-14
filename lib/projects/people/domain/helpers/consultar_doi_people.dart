import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/people/data/services/consulta_doi_service.dart';
import 'package:solgis/projects/people/data/services/datos_acceso_movimiento_services.dart';
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
      // Navigator.pushReplacementNamed(context, 'ingreso_autorizado_people', arguments: consulta);

    }else {

      //OBTENGO LOS DATOS DE ACCESO DEL MOVIMIENTO DE ENTRADA.
      final datos_acceso = await DatosAccesoService().getDatosAccesosMovimiento(consulta.codigoServicio, consulta.codigoPersona!);

      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, 'salida_autorizada_people', arguments: {
        'consulta'    : consulta,
        'datos_acceso': datos_acceso,
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

            onPressed: ()=>Navigator.pushReplacementNamed(context, 'crear_personal_page_people', arguments: {
              "dni_persona" : documento,
              "cod_servicio" : codServicio,
            }),

          ),

          TextButton(

            child: const Text("No"),
            onPressed: (){

              Navigator.pop(context);

            }

          ),

        ],

      ).show(context);

    }

  }

}


  // if(consulta.resultado == 'OK'){

  //   if(consulta.tipoConsulta == 'INGRESO AUTORIZADO'){

  //     // ignore: use_build_context_synchronously
  //     Navigator.pushNamed(context, 'ingreso_autorizado_people', arguments:  consulta);
  //     // Navigator.pushReplacementNamed(context, 'ingreso_autorizado_people', arguments: consulta);
  //   }else {

  //     //OBTENGO LOS DATOS DE ACCESO DEL MOVIMIENTO DE ENTRADA.
  //     final datos_acceso = await DatosAccesoService().getDatosAccesosMovimiento(consulta.codigoServicio, consulta.codigoPersona!);

  //     // ignore: use_build_context_synchronously
  //     Navigator.pushNamed(context, 'salida_autorizada_people', arguments: {
  //       'consulta'    : consulta,
  //       'datos_acceso': datos_acceso,
  //     });

  //   }

  // }else{
    
  //   if(consulta.docPersona != null){
      
  //     // ignore: use_build_context_synchronously
  //     Navigator.pushNamed(context, 'ingreso_denegado_people', arguments: consulta);

  //   }else{

  //     // ignore: use_build_context_synchronously
  //     await NDialog(

  //       dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.white),
  //       title:  const Text("INFORMACION",  style: TextStyle(color: Colors.black)),
  //       content:  const Text("El personal no se encuentra en el sistema \n ¿Deseas registar al personal?", style: TextStyle(color: Colors.black)),  
        
  //       actions: <Widget>[

  //         TextButton(

  //           child: const Text("Si"),

  //           onPressed: ()=>Navigator.pushReplacementNamed(context, 'crear_personal_page_people', arguments: {
  //             "dni_persona" : documento,
  //             "cod_servicio" : codServicio,
  //           }), 
  //         ),

  //         TextButton(

  //           child: const Text("No"),
  //           onPressed: ()=> Navigator.pop(context)

  //         ),

  //       ],
      
  //     ).show(context);

  //   }

  // }





  // // ignore: use_build_context_synchronously
  // if(consulta.tipoConsulta == 'INGRESO AUTORIZADO') Navigator.pushNamed(context, 'ingreso_autorizado_people', arguments:  consulta);

  // if(consulta.tipoConsulta == 'SALIDA AUTORIZADA') {

  //   //OBTENGO LOS DATOS DE ACCESO DEL MOVIMIENTO DE ENTRADA.
  //   final datosAcceso = await DatosAccesoService().getDatosAccesosMovimiento(consulta.codigoServicio, consulta.codigoPersona!);

  //   // ignore: use_build_context_synchronously
  //   Navigator.pushNamed(context, 'salida_autorizada_people', arguments: {
  //     'consulta'    : consulta,
  //     'datos_acceso': datosAcceso,
  //   });
  // }

  // // ignore: use_build_context_synchronously
  // if(consulta.codigoPersona == -1 ) Navigator.pushNamed(context, 'ingreso_denegado_people', arguments: consulta);

  // if(consulta.codigoPersona == 0 ) {
  //   // ignore: use_build_context_synchronously
  //   await NDialog(

  //     dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.white),
  //     title:  const Text("INFORMACION",  style: TextStyle(color: Colors.black)),
  //     content:  const Text("El personal no se encuentra en el sistema \n ¿Deseas registar al personal?", style: TextStyle(color: Colors.black)),  
      
  //     actions: <Widget>[

  //       TextButton(

  //         child: const Text("Si"),

  //         onPressed: ()=>Navigator.pushReplacementNamed(context, 'crear_personal_page_people', arguments: {
  //           "dni_persona" : documento,
  //           "cod_servicio" : codServicio,
  //         }), 

  //       ),

  //       TextButton(

  //         child: const Text("No"),
  //         onPressed: ()=> Navigator.pop(context)

  //       ),

  //     ],
    
  //   ).show(context);
  // }