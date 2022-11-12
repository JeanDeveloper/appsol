import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:solgis/projects/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/projects/people/domain/models/autorizacion_model.dart';
import 'package:solgis/projects/people/presentation/pages/consulta/widgets/widgets.dart';
import 'package:solgis/projects/people/presentation/widgets/widgets.dart';
import 'package:solgis/projects/people/styles/style.dart';

class ConsultaPage extends StatelessWidget {
  const ConsultaPage({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context){
  
    // final consulta = ModalRoute.of(context)!.settings.arguments as ConsultaModel;
    Map argumentos = ModalRoute.of(context)!.settings.arguments as Map;
    ConsultaModel consulta = argumentos['consulta'];
    AutorizacionModel autorizacion = argumentos['autorizacion'];
    return Scaffold(

        appBar: AppBar(
          leading: IconButton(
            onPressed: ()=>Navigator.of(context).pop(), 
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white,)
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text('CONSULTA', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
        ),

        body: _ConsultaPageBody(consulta: consulta, autorizacion: autorizacion, ),

    );
  }
}

class _ConsultaPageBody extends StatelessWidget {

  final ConsultaModel consulta;
  final AutorizacionModel autorizacion;

  const _ConsultaPageBody({
    Key? key, 
    required this.consulta, 
    required this.autorizacion
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('es');

    final size = MediaQuery.of(context).size;

    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      child: Column(

        children: [

          CardImage(urlImage: consulta.img),

          ContainerEstatus( valor: autorizacion.valor! ),

          SizedBox(height: size.height*0.02),

          //CAMPO DNI
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('DNI:', style: styleCrearPersonaltextForm()),
              InputReadOnlyWidget(initialValue: consulta.docPersona),
            ]
          ),

          SizedBox(height: size.height*0.02), 

          //CAMPO NOMBRES
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('NOMBRES:  ', style: styleCrearPersonaltextForm()),
              InputReadOnlyWidget(initialValue: consulta.nombresPersona),
            ]
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO CARGO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('CARGO:  ', style: styleCrearPersonaltextForm()),
              InputReadOnlyWidget(initialValue: consulta.cargo),
            ]
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO EMPRESA
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('EMPRESA:  ', style: styleCrearPersonaltextForm()),
              InputReadOnlyWidget(initialValue: consulta.empresa),
            ]
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO AUTORIZANTE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('AUTORIZANTE:  ', style: styleCrearPersonaltextForm()),
              InputReadOnlyWidget(initialValue: consulta.autorizante ),
            ],
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO MOTIVO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('MOTIVO:  ', style: styleCrearPersonaltextForm()),
              InputReadOnlyWidget(initialValue: consulta.motivo),
            ],
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO ACCESO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ACCESSO:  ', style: styleCrearPersonaltextForm().copyWith(fontSize: 13)),
              InputReadOnlyWidget(initialValue: consulta.area),
            ],
          ),

          SizedBox(height: size.height*0.02), 

          //MENSAJE
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: size.height* .2 ,
            alignment: Alignment.center,
            child: Text(autorizacion.mensaje! , style: const TextStyle(color: Colors.red),)
          )

        ],
      ),
    );
  }
}

