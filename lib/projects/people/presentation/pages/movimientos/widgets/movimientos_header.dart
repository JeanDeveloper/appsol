import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/people/data/services/movimiento_service.dart';
import 'package:solgis/projects/people/presentation/widgets/widgets.dart';

class MovimientosListButton extends StatelessWidget {

  final int index;

  const MovimientosListButton({
    required this.index, 
  });

  @override
  Widget build(BuildContext context) {

    initializeDateFormatting('es');
    final size = MediaQuery.of(context).size;
    final contadorProvider = Provider.of<MovimientosProvider>(context);
    final gProvider = Provider.of<GlobalProvider>(context);

    return Container(

      padding: const EdgeInsets.only(top: 20),
      height: (gProvider.codCliente == '25866')? size.height * .25 : size.height * .18,

      child: Column(

        children: [

          //DIA Y FECHA.
          AutoSizeText(DateFormat('EEEE, d MMMM yyyy', 'es').format(DateTime.now()), style: GoogleFonts.aBeeZee(), minFontSize: 6),

          SizedBox( height: size.height*0.01),

          //CANTIDAD.
          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [

              AutoSizeText('Cantidad:', style: TextStyle( color: Colors.green, fontSize: size.height* .03, fontWeight: FontWeight.bold), minFontSize: 6),
              SizedBox( width: size.width*0.01),
              AutoSizeText( contadorProvider.getmovimientosContador.toString(), style: TextStyle(fontSize: size.height*0.03, fontWeight: FontWeight.bold, color: Colors.black), minFontSize: 6),

            ],

          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical:20),
            child: Row(

              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                //PROPIO
                RadioListButton(
                  width: size.width*0.2,
                  index: index,
                  title:'Propio',
                  // icon: Icons.engineering,
                  value: 1,
                ),

              //CONTRATISTA
              RadioListButton(
                width: size.width*0.3,
                index: index,
                title:'Contratista',
                // icon: Icons.engineering,
                value: 3,
              ),

                //VISITANTE
                RadioListButton(
                  width: size.width*0.2,
                  index: index,
                  // icon: Icons.visibility,
                  title: 'Visita',
                  value: 2
                ),

              //AUTORIDAD

              RadioListButton(
                width: size.width*0.3,
                index: index,
                title: 'Autoridad',
                // icon: Icons.cro,
                value: 4,
              ),

            ],

          ),


          ),

          if( gProvider.codCliente == '25866' )
            SizedBox( width: size.height*0.03),
          //SE REMOVIO EL SIZEDBOX CON WIDTH INFINITY Y HEIGHT size.height*0.05
          if(gProvider.codCliente == '25866')
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [

                //IMPORTACION
                RadioListButton(
                  width: size.width*0.24,
                  index: index,
                  title: 'Impo',
                  // icon: Icons.arrow_circle_down_rounded,
                  value: 6,
                ),

                //EXPORTACION
                RadioListButton(
                  width: size.width*0.24,
                  index: index,
                  // icon:Icons.arrow_circle_up_outlined,
                  title: 'Expo',
                  value: 7,
                ),            

              ],

            ),

        ],

      ),
    );

  }
}