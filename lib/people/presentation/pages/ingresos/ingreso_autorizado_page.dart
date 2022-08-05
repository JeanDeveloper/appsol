import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:solgis/people/data/services/movimiento_service.dart';
import 'package:solgis/people/domain/helpers/show_snackbar_awesome.dart';
import 'package:solgis/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/people/domain/providers/ingreso_autorizado_provider.dart';
import 'package:solgis/people/presentation/pages/ingresos/ingreso_template_page.dart';
import 'package:solgis/people/presentation/widgets/widgets.dart';
import 'package:solgis/theme/theme_people.dart';

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
                CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);
                progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppThemePeople.lighThemePeople.primaryColor)));
                progressDialog.show();

                //funcion para registrar el movimiento.
                final idMovimiento = await movimientoProvider.registerMovimiento(consulta);

                print(idMovimiento);

                progressDialog.dismiss();

                // ignore: use_build_context_synchronously
                showSnackBarAwesome(context, 'EXITO', 'Se registro el movimiento para el personal ${consulta.docPersona} con exito', ContentType.success);

                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, 'home_people');

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