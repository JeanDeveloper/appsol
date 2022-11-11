import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/people/data/services/movimiento_service.dart';
import 'package:solgis/projects/people/domain/helpers/show_snackbar_awesome.dart';
import 'package:solgis/projects/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/projects/people/domain/models/datos_acceso_movimiento_model.dart';
import 'package:solgis/projects/people/domain/providers/registrar_form_provider.dart';
import 'package:solgis/projects/people/domain/providers/salida_provider.dart';
import 'package:solgis/projects/people/domain/utils/scanning_infinity.dart';
import 'package:solgis/projects/people/theme/theme.dart';

validatingFieldsExitMov(BuildContext context, ConsultaModel consulta)async{
  final movimientoProvider = Provider.of<MovimientosProvider>(context, listen: false);
  final salidaProvider = Provider.of<SalidaProvider>(context, listen: false);
  final loginGlobal = Provider.of<GlobalProvider>(context,listen: false);
  final registerProvider = Provider.of<RegistrarFormProvider>(context, listen: false);
  

  CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);
  progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppThemePeople.lighThemePeople.primaryColor)));
  progressDialog.show();
  final datosAcceso = DatosAccesoMModel();

  if(salidaProvider.materialValor != '' ) datosAcceso.materialMovimiento= salidaProvider.materialValor;
  if(salidaProvider.guia!= '') datosAcceso.guiaMovimiento = salidaProvider.guia;

  await movimientoProvider.registerMovimiento(context, consulta, datosAcceso);

    if(salidaProvider.fotoGuia != null ) {
      await movimientoProvider.uploadImage(salidaProvider.fotoGuia!.path, 'PEOPLE', 1, loginGlobal.codServicio, consulta.codigoPersona.toString());
    }

    if(salidaProvider.fotoMaterialValor != null ) {
        await movimientoProvider.uploadImage(salidaProvider.fotoMaterialValor!.path, 'PEOPLE', 2, loginGlobal.codServicio, consulta.codigoPersona.toString());
    }

  progressDialog.dismiss();

  // ignore: use_build_context_synchronously
  showSnackBarAwesome(context, 'EXITO', 'Se registro el movimiento para el personal ${consulta.docPersona} con exito', ContentType.success);

  // ignore: use_build_context_synchronously
  Navigator.pop(context);

  // ignore: use_build_context_synchronously
  if(registerProvider.isScanning==true) scanningInfinity(registerProvider.registerContext);



}