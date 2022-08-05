import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


class IngresoDenegadoWidget extends StatelessWidget {

  final String? mensaje;

  const IngresoDenegadoWidget({required this.mensaje});


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(

      padding: EdgeInsets.symmetric(horizontal:size.width*0.12, vertical:  size.height*0.06),
      width: double.infinity,
      height: size.height*0.34,

      child: Center(

        child:  AutoSizeText(

          mensaje!.toUpperCase(), 
          textAlign: TextAlign.center, 

          style: TextStyle(

            color: Colors.red, 
            fontSize: size.width*0.04

          )

        )

      ),

    );

  }
  
}