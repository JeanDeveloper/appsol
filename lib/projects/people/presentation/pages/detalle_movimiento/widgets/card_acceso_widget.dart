import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:solgis/projects/people/domain/models/datos_acceso_movimiento_model.dart';
import 'package:solgis/projects/people/presentation/pages/detalle_movimiento/widgets/widgets.dart';

class CardAccesoWidget extends StatelessWidget {

  final String title;

  final List<DatoAccesoMModel>? datosSalida;

  const CardAccesoWidget({
    Key? key, 
    required this.title,
    required this.datosSalida,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if(datosSalida == null) return Container();

    return Padding(

      padding: EdgeInsets.only(top: size.height*.09),

      child: Column(

        children: [

          AutoSizeText(title, style: const TextStyle(color: Color(0xff284393), fontSize: 18)),

          SizedBox(height: size.height* .03),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: datosSalida!.map((dato) {
                return CardAcceso(
                  tipoDatoAcceso: (dato.codTipoDatoAcceso == 1)? 'Guia' : 'Material', 
                  pathUrl: dato.pathImage,
                  textDato: dato.descripcion,
                );
            }).toList(),
          ),

        ],

      ),

    );

  }

}



            // children: [

            //   if(guiaMov != '')
                // CardAcceso(
                //   tipoDatoAcceso: 'Guia', 
                //   pathUrl: urlGuiaMov,
                //   textDato: guiaMov,
                // ),

            //   if(materialMov != '')
            //     SizedBox(width: size.width*0.1),

            //   if(materialMov != '')
            //     CardAcceso(
            //       tipoDatoAcceso: 'Material', 
            //       pathUrl: urlMaterialMov,
            //       textDato: materialMov,
            //     ),
            // ],