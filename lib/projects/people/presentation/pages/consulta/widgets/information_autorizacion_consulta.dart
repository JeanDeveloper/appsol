import 'package:flutter/material.dart';
import 'package:solgis/projects/people/data/services/autorizacion_service.dart';
import 'package:solgis/projects/people/domain/models/autorizacion_model.dart';
import 'package:solgis/projects/people/domain/models/consulta_persona_model.dart';

class InfoAutorizacionWidget extends StatelessWidget {
  final ConsultaModel consulta;

  const InfoAutorizacionWidget({super.key, required this.consulta});

  @override
  Widget build(BuildContext context) {

    AutorizacionService autorizacionService = AutorizacionService();
    final size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: autorizacionService.getConsulta(consulta.codigoServicio.toString(), consulta.codigoPersona.toString(), consulta.tipoPersona![0]),

      builder:  ( _ , AsyncSnapshot<AutorizacionModel>snapshot ){

        if(!snapshot.hasData) return const Center(child: CircularProgressIndicator());


        final autorizacion = snapshot.data;

        return Column(
          children: [

          ],
        );



      }
    );
  }
}



class _ContainerEstado extends StatelessWidget {

  const _ContainerEstado({
    Key? key,
    required this.size, 
    required this.text, 
    required this.color,
  }) : super(key: key);

  final Size size;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {

    return Container(

      height: size.height*0.05,
      width: size.width*0.5,

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50)
      ),

      alignment: Alignment.center,
      child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),

    );

  }

}