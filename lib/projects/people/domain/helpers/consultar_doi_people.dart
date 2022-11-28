import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/person_auth_provider.dart';

import 'package:solgis/projects/people/data/services/consulta_doi_service.dart';
import 'package:solgis/projects/people/data/services/datos_acceso_movimiento_service.dart';
import 'package:solgis/projects/people/data/services/personal_service.dart';
import 'package:solgis/projects/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/projects/people/domain/models/persona_model.dart';
import 'package:solgis/projects/people/domain/providers/numpad_provider.dart';
import 'package:solgis/projects/people/theme/theme.dart';

void consultarDOI(BuildContext context, String documento, String codServicio, String codCliente ) async {

  CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);
  final numpadProvider= Provider.of<NumPadProvider>(context, listen: false); 
  final loginProvider = Provider.of<PersonAuthProvider>(context, listen: false);

  progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppThemePeople.lighThemePeople.primaryColor)));
  progressDialog.show();
  ConsultaModel consulta = await ConsultaDOIService().getConsulta(documento, codServicio);

  progressDialog.dismiss();

  if(consulta.resultado == 'OK'){

    if(consulta.tipoConsulta == 'INGRESO AUTORIZADO'){

      // ignore: use_build_context_synchronously
      if(consulta.codigoTipoPersona == null || consulta.codigoEmpresa == null || consulta.codigoCargo == null ) {
        // ignore: use_build_context_synchronously
        await NDialog(
          dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.white),
          title:  const Text("INFORMACION",  style: TextStyle(color: Colors.black)),
          content:  const Text("El Personal se encuentra en el sistema \n ¿Deseas habilitarlo ?", style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            TextButton(
              child: const Text("Si"),
              onPressed: ()async{

                //TODO: REALIZAR LA VERIFICACION SI EL PERSONAL ESTA EN LA BASE DE DATOS O NO.
                PersonalValidacionModel respValidacion = await PersonalProvider().validarPersonal(documento, codCliente, codServicio);

                //TODO: HACER LA HABILITACION Y CREACION DE LA RELACION CON EL SERVICIO.
                await PersonalProvider().habilitarPersonal( respValidacion.codPersonal!, 'PEOPLE_${loginProvider.dni}', codCliente );

                PersonalModel personalModel = await PersonalProvider().obtenerPersonal(respValidacion.codPersonal, codCliente);

                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, 'habilitar_personal', arguments: personalModel);

              },
            ),
            TextButton(
              child: const Text("No"),
              onPressed: ()=> Navigator.pop(context),
            ),
          ],
        ).show(context);

      }else{
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, 'ingreso_autorizado_people', arguments:  consulta);
      }

    }else {

      // ignore: use_build_context_synchronously
      if(consulta.codigoTipoPersona == null || consulta.codigoEmpresa == null || consulta.codigoCargo == null ) {

        // ignore: use_build_context_synchronously
        await NDialog(
          dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.white),
          title:  const Text("INFORMACION",  style: TextStyle(color: Colors.black)),
          content:  const Text("El Personal se encuentra en el sistema \n ¿Deseas habilitarlo ?", style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            TextButton(
              child: const Text("Si"),
              onPressed: ()async{
                //TODO: REALIZAR LA VERIFICACION SI EL PERSONAL ESTA EN LA BASE DE DATOS O NO.
                PersonalValidacionModel respValidacion = await PersonalProvider().validarPersonal(documento, codCliente, codServicio);
                //TODO: HACER LA HABILITACION Y CREACION DE LA RELACION CON EL SERVICIO.
                await PersonalProvider().habilitarPersonal( respValidacion.codPersonal!, 'PEOPLE_${loginProvider.dni}', codCliente );
                PersonalModel personalModel = await PersonalProvider().obtenerPersonal(respValidacion.codPersonal, codCliente);
                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, 'habilitar_personal', arguments: personalModel);
              },
            ),
            TextButton(
              child: const Text("No"),
              onPressed: ()=> Navigator.pop(context),
            ),
          ],
        ).show(context);

      } else {

        //OBTENGO LOS DATOS DE ACCESO DEL MOVIMIENTO DE ENTRADA.
        final datosAcceso = await DatosAccesoService().getDatosAccesosMovimiento(1, consulta.codigoServicio, consulta.docPersona!);

        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, 'salida_autorizada_people', arguments: {
          'consulta'    : consulta,
          'datos_acceso': datosAcceso,
        });

      }

    }

    numpadProvider.dni = '';
    numpadProvider.carnet = '';

  }else{

    if(consulta.docPersona != null){

      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, 'ingreso_denegado_people', arguments: consulta);

    }else{

      //TODO: REALIZAR LA VERIFICACION SI EL PERSONAL ESTA EN LA BASE DE DATOS O NO. 
      PersonalValidacionModel respValidacion = await PersonalProvider().validarPersonal(documento, codCliente, codServicio);

      if(respValidacion.estadoTransaccion == -1){
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

      if(respValidacion.estadoTransaccion == 2){

        // ignore: use_build_context_synchronously
        await NDialog(
          dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.white),
          title:  const Text("INFORMACION",  style: TextStyle(color: Colors.black)),
          content:  const Text("El Personal se encuentra en el sistema \n ¿Deseas habilitarlo ?", style: TextStyle(color: Colors.black)),
          actions: <Widget>[

            TextButton(
              child: const Text("Si"),
              onPressed: ()async{

                //TODO: HACER LA HABILITACION Y CREACION DE LA RELACION CON EL SERVICIO.
                await PersonalProvider().habilitarPersonal( respValidacion.codPersonal!, 'PEOPLE_${loginProvider.dni}', codCliente );

                PersonalModel personalModel = await PersonalProvider().obtenerPersonal(respValidacion.codPersonal, codCliente);

                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, 'habilitar_personal', arguments: personalModel);

              },

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

}



