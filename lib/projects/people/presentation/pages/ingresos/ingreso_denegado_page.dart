import 'package:flutter/material.dart';
import 'package:solgis/projects/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/projects/people/presentation/pages/ingresos/widgets/ingreso_denegado_widget.dart';
import 'package:solgis/projects/people/presentation/pages/pages.dart';


class IngresoDenegadoPage extends StatelessWidget {
  
  const IngresoDenegadoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final consulta = ModalRoute.of(context)!.settings.arguments as ConsultaModel;
    
    return IngresosTemplatePage(

      titleIngreso: 'INGRESO DENEGADO', 
      colorAppBar: Colors.red, 
      body: IngresoDenegadoWidget(mensaje: consulta.mensaje),

      consulta:consulta,
      
      registrarFunction: null,

    );

  }

}