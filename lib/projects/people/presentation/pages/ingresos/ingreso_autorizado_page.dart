import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/people/data/services/movimiento_service.dart';
import 'package:solgis/projects/people/domain/helpers/show_snackbar_awesome.dart';
import 'package:solgis/projects/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/projects/people/domain/models/datos_acceso_movimiento_model.dart';
import 'package:solgis/projects/people/domain/providers/ingreso_autorizado_provider.dart';
import 'package:solgis/projects/people/presentation/pages/ingresos/ingreso_template_page.dart';
import 'package:solgis/projects/people/presentation/pages/ingresos/widgets/widgets.dart';
import 'package:solgis/projects/people/theme/theme.dart';
import 'package:vibration/vibration.dart';

class IngresoAutorizadoPage extends StatelessWidget {

  const IngresoAutorizadoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        
    final consulta = ModalRoute.of(context)!.settings.arguments as ConsultaModel;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => IngresoAutorizadoProvider())),
      ],
      child: IngresoAutorizadoBody(consulta: consulta),
    );

  }
  
}

class IngresoAutorizadoBody extends StatelessWidget {

  final ConsultaModel consulta;

  const IngresoAutorizadoBody({
    Key? key, 
    required this.consulta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ingresoProvider = Provider.of<IngresoAutorizadoProvider>(context, listen: false);

    return IngresosTemplatePage(

      titleIngreso: 'INGRESO AUTORIZADO', 
      colorAppBar: Colors.green, 
      body: IngresoAutorizadoWidget(consulta: consulta),
      consulta: consulta,
      registrarFunction: () async {

        await NDialog(

          dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.white),
          title: const Text("¡Alerta!",),
          content: const Text(" ¿Estas seguro que deseas registrar el movimiento? ", style: TextStyle(color: Colors.black)),  

          actions: <Widget>[

            TextButton(

              child: const Text("SI"),

              onPressed: () async {

                final movimientoProvider = Provider.of<MovimientosProvider>(context, listen: false);
                final datosAcceso = DatosAccesoMModel();
                CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);
                progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppThemePeople.lighThemePeople.primaryColor)));
                progressDialog.show();

                if(ingresoProvider.material_valor != '') datosAcceso.materialMovimiento = ingresoProvider.material_valor; 
                if(ingresoProvider.guia != '') datosAcceso.guiaMovimiento = ingresoProvider.guia; 

                //funcion para registrar el movimiento.
                if(

                  consulta.codigoClienteControl == 5     || consulta.codigoClienteControl == 28463 ||  
                  consulta.codigoClienteControl == 22702 || consulta.codigoClienteControl == 13    || 
                  consulta.codigoClienteControl == 14517

                ){

                  await movimientoProvider.registerMovimiento(context, consulta, datosAcceso);

                }else{

                  //ACTUALIZANDO LOS CODIGOS DEL AUTORIZANTE, CODIGO DE AREA Y CODIGO MOTIVOO
                  consulta.codigoAutorizante = ingresoProvider.cod_autorizante;
                  consulta.autorizante       = ingresoProvider.autorizante;
                  consulta.area              = ingresoProvider.area_acceso;
                  consulta.codigoArea        = ingresoProvider.cod_area;
                  consulta.motivo            = ingresoProvider.motivo;
                  consulta.codigoMotivo      = ingresoProvider.cod_motivo;

                  await movimientoProvider.registerMovimiento(context, consulta, datosAcceso);

                } 

                progressDialog.dismiss();

                // bool? hasvibration = await Vibration.hasVibrator();

                // if( hasvibration! ){
                //   Vibration.vibrate(pattern: [500, 1000, 500, 2000], intensities: [1, 255]);
                // }

                // ignore: use_build_context_synchronously
                showSnackBarAwesome(context, 'EXITO', 'Se registro el movimiento para el personal ${consulta.docPersona} con exito', ContentType.success);

                // ignore: use_build_context_synchronously
                Navigator.pushNamedAndRemoveUntil(context, '/', ModalRoute.withName(''));
                // Navigator.pushNamedAndRemoveUntil(context, '/');
              }

            ),

            TextButton(
              child: const Text("NO"),
              onPressed: () => Navigator.pop(context)
            ),

          ],

        ).show(context);

      },

    );

  }

}