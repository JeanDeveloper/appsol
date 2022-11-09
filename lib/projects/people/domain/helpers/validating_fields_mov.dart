import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/people/data/services/movimiento_service.dart';
import 'package:solgis/projects/people/data/services/personal_service.dart';
import 'package:solgis/projects/people/domain/helpers/show_snackbar_awesome.dart';
import 'package:solgis/projects/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/projects/people/domain/models/datos_acceso_movimiento_model.dart';
import 'package:solgis/projects/people/domain/providers/ingreso_autorizado_provider.dart';
import 'package:solgis/projects/people/domain/providers/registrar_form_provider.dart';
import 'package:solgis/projects/people/domain/utils/get_result_scanner.dart';
import 'package:solgis/projects/people/theme/theme.dart';


validatingFields(BuildContext context, ConsultaModel consulta)async {

  final ingresoProvider = Provider.of<IngresoAutorizadoProvider>(context, listen: false);
  final loginGlobal = Provider.of<GlobalProvider>(context,listen: false);
  final movimientoProvider = Provider.of<MovimientosProvider>(context, listen: false);
  final registerProvider = Provider.of<RegistrarFormProvider>(context, listen: false);

  final datosAcceso = DatosAccesoMModel();
  
  if(!ingresoProvider.isValidForm())return showSnackBarAwesome(context, 'Atencion', 'Hay datos sin llenar', ContentType.failure); 

  CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);
  progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppThemePeople.lighThemePeople.primaryColor)));
  progressDialog.show();

  if(ingresoProvider.material_valor != '') datosAcceso.materialMovimiento = ingresoProvider.material_valor; 
  if(ingresoProvider.guia != '') datosAcceso.guiaMovimiento = ingresoProvider.guia; 

  //FUNCION PARA REGISTRAR UN MOVIMIENTO
  //ACTUALIZANDO LOS CODIGOS DEL AUTORIZANTE, CODIGO DE AREA Y CODIGO MOTIVOO

  if(consulta.codigoAutorizante == 0 ||  consulta.codigoAutorizante == -1){
    consulta.codigoAutorizante = ingresoProvider.codautorizante;
    consulta.autorizante       = ingresoProvider.autorizante;
  }

  if(consulta.codigoArea == 0 ||  consulta.codigoArea == -1){
    consulta.codigoArea        = ingresoProvider.cod_area;
    consulta.area              = ingresoProvider.area_acceso;
  }

  if(consulta.codigoMotivo == 0 || consulta.codigoMotivo == -1){
    consulta.codigoMotivo      = ingresoProvider.cod_motivo;
    consulta.motivo            = ingresoProvider.motivo;
  }

  await movimientoProvider.registerMovimiento(context, consulta, datosAcceso);
  if(ingresoProvider.fotoGuia != null ) await movimientoProvider.uploadImage(ingresoProvider.fotoGuia!.path, 'PEOPLE', 1, loginGlobal.codServicio, consulta.codigoPersona.toString());
  if(ingresoProvider.fotoMaterialValor != null)  await movimientoProvider.uploadImage(ingresoProvider.fotoMaterialValor!.path, 'PEOPLE', 2, loginGlobal.codServicio, consulta.codigoPersona.toString() );
  if(ingresoProvider.fotoPersonalUpdate !=null) await PersonalProvider().uploadPhotoPersonal(ingresoProvider.fotoPersonalUpdate!, consulta.codigoPersona.toString());

  progressDialog.dismiss();

  // ignore: use_build_context_synchronously
  showSnackBarAwesome(context, 'EXITO', 'Se registro el movimiento para el personal ${consulta.docPersona} con exito', ContentType.success);

  // ignore: use_build_context_synchronously
  Navigator.of(context).pop();
  // Navigator.of(context,rootNavigator: true).pop();
  // Navigator.pop(context);

}

