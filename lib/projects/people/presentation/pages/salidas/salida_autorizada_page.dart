import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/people/data/services/movimiento_service.dart';
import 'package:solgis/projects/people/domain/helpers/show_snackbar_awesome.dart';
import 'package:solgis/projects/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/projects/people/domain/models/datos_acceso_movimiento_model.dart';
import 'package:solgis/projects/people/domain/providers/salida_provider.dart';
import 'package:solgis/projects/people/presentation/pages/salidas/widgets/widgets.dart';
import 'package:solgis/projects/people/theme/theme.dart';
import 'package:vibration/vibration.dart';

class SalidaAutorizadaPage extends StatelessWidget {

  const SalidaAutorizadaPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  Map argm = ModalRoute.of(context)!.settings.arguments as Map;
  ConsultaModel consulta = argm['consulta'];
  DatosAccesoMModel? datosAcceso = argm['datos_acceso'];
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => SalidaProvider()))
      ],
      child: SalidaAutorizadaBody(consulta:  consulta, datosAcceso: datosAcceso),
    );
  }

}

class SalidaAutorizadaBody extends StatelessWidget {

  final ConsultaModel consulta;
  final DatosAccesoMModel? datosAcceso;

  const SalidaAutorizadaBody({
    Key? key, 
    required this.consulta, 
    required this.datosAcceso,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salidaProvider = Provider.of<SalidaProvider>(context, listen: false);

    return SalidaTemplatePage(
      titleIngreso: 'Salida Autorizada', 
      colorAppBar: const Color(0xffF57E25), 
      body: SalidaAutorizadaWidget(consulta: consulta, datosAcceso: datosAcceso),
      consulta: consulta,
      registrarFunction: () async {

        final movimientoProvider = Provider.of<MovimientosProvider>(context, listen: false);
        CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);
        progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppThemePeople.lighThemePeople.primaryColor)));
        progressDialog.show();
        final datosAcceso = DatosAccesoMModel();

        if(salidaProvider.materialValor != '' ) datosAcceso.materialMovimiento= salidaProvider.materialValor;
        if(salidaProvider.guia!= '') datosAcceso.guiaMovimiento = salidaProvider.guia;

        await movimientoProvider.registerMovimiento(context, consulta, datosAcceso);

        progressDialog.dismiss();

        // bool? hasvibration = await Vibration.hasVibrator();

        // if( hasvibration! ){
        //   Vibration.vibrate(pattern: [500, 1000, 500, 2000], intensities: [1, 255]);
        // }

        // ignore: use_build_context_synchronously
        showSnackBarAwesome(context, 'EXITO', 'Se registro el movimiento para el personal ${consulta.docPersona} con exito', ContentType.success);

        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        // Navigator.pushReplacementNamed(context, 'registrar_movimiento_people');
        // Navigator.pushNamedAndRemoveUntil(context, '/', ModalRoute.withName(''));

        // await NDialog(

        //   dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.white),
        //   title: const Text("¡Alerta!",),
        //   content: const Text(" ¿Estas seguro que deseas registrar el movimiento? ", style: TextStyle(color: Colors.black)),  

        //   actions: <Widget>[

        //     TextButton(

        //       child: const Text("SI"),

        //       onPressed: () async {

        //         final movimientoProvider = Provider.of<MovimientosProvider>(context, listen: false);
        //         CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);
        //         progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppThemePeople.lighThemePeople.primaryColor)));
        //         progressDialog.show();
        //         final datosAcceso = DatosAccesoMModel();

        //         if(salidaProvider.materialValor != '' ) datosAcceso.materialMovimiento= salidaProvider.materialValor;
        //         if(salidaProvider.guia!= '') datosAcceso.guiaMovimiento = salidaProvider.guia;

        //         await movimientoProvider.registerMovimiento(context, consulta, datosAcceso);

        //         //funcion para registrar el movimiento.
        //         // if(

        //         //   consulta.codigoClienteControl == 5     || consulta.codigoClienteControl == 28463 ||  
        //         //   consulta.codigoClienteControl == 22702 || consulta.codigoClienteControl == 13    || 
        //         //   consulta.codigoClienteControl == 14517

        //         // ){
        //         //   await movimientoProvider.registerMovimiento(context, consulta);
        //         // }else{

        //         //   //ACTUALIZANDO LOS CODIGOS DEL AUTORIZANTE, CODIGO DE AREA Y CODIGO MOTIVOO
        //         //   // consulta.codigoAutorizante = ingresoProvider.cod_autorizante;
        //         //   // consulta.autorizante       = ingresoProvider.autorizante;
        //         //   // consulta.area              = ingresoProvider.area_acceso;
        //         //   // consulta.codigoArea        = ingresoProvider.cod_area;
        //         //   // consulta.motivo            = ingresoProvider.motivo;
        //         //   // consulta.codigoMotivo      = ingresoProvider.cod_motivo;

        //         //   await movimientoProvider.registerMovimiento(context, consulta);

        //         // } 

        //         progressDialog.dismiss();

        //         // bool? hasvibration = await Vibration.hasVibrator();

        //         // if( hasvibration! ){
        //         //   Vibration.vibrate(pattern: [500, 1000, 500, 2000], intensities: [1, 255]);
        //         // }

        //         // ignore: use_build_context_synchronously
        //         showSnackBarAwesome(context, 'EXITO', 'Se registro el movimiento para el personal ${consulta.docPersona} con exito', ContentType.success);

        //         // ignore: use_build_context_synchronously
        //         Navigator.pushNamedAndRemoveUntil(context, '/', ModalRoute.withName(''));
        //         // Navigator.pushReplacementNamed(context, 'registrar_movimiento_people');

        //       }
        //     ),

        //     TextButton(
        //       child: const Text("NO"),
        //       onPressed: () => Navigator.pop(context)
        //     ),

        //   ],

        // ).show(context);

      },

    );
  }

}
