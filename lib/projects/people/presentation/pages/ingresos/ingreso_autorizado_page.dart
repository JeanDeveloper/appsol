import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/people/domain/helpers/validating_fields_entry_mov.dart';
import 'package:solgis/projects/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/projects/people/domain/providers/ingreso_autorizado_provider.dart';
import 'package:solgis/projects/people/presentation/pages/ingresos/ingreso_template_page.dart';
import 'package:solgis/projects/people/presentation/pages/ingresos/widgets/widgets.dart';

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
        validatingFieldsEntryMov(context, consulta);
      },
    );
  }
}