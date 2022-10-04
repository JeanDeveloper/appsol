import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/people/data/services/movimiento_service.dart';
import 'package:solgis/projects/people/presentation/widgets/widgets.dart';
import 'package:solgis/projects/people/styles/style.dart';

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

      padding: const EdgeInsets.symmetric(vertical:30),
      width: double.infinity,
      height: size.height*0.25,

      child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          AutoSizeText(DateFormat('EEEE, d MMMM yyyy', 'es').format(DateTime.now()), style: textStyleDate(), minFontSize: 6),

          Row(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              AutoSizeText('CANTIDAD:', style: TextStyle( color: Colors.green, fontSize: size.height*0.03, fontWeight: FontWeight.bold), minFontSize: 6),
              SizedBox( width: size.width*0.03),
              AutoSizeText( contadorProvider.getmovimientosContador.toString(), style: TextStyle(fontSize: size.height*0.03, fontWeight: FontWeight.bold, color: Colors.black), minFontSize: 6),

            ],

          ),

          Container(
            width: double.infinity,
            height: size.height*0.05,
            alignment: Alignment.center,

            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [

                //TODOS
                RadioListButton(
                  width: size.width*0.24,
                  index: index,
                  title: 'TODOS',
                  value: 0,
                ),

                //PROPIO
                RadioListButton(
                  width: size.width*0.24,
                  index: index,
                  title: 'PROPIO',
                  value: 1,
                ),

                //VISITANTE
                RadioListButton(
                  width: size.width*0.24,
                  index: index,
                  title: 'VISITA',
                  value: 2
                ),

                //TERCERO
                if(gProvider.codCliente != '28463' && gProvider.codCliente != '30361')
                RadioListButton(
                  width: size.width*0.24,
                  index: index,
                  title: 'TERCERO',
                  value: 3,
                ),

              ],

            ),

          ),

          SizedBox( width: size.height*0.03),

          SizedBox(

            width: double.infinity,
            height: size.height*0.05,

            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [

                //TERCERO
                if(gProvider.codCliente == '28463' || gProvider.codCliente == '30361')
                RadioListButton(
                  width: size.width*0.24,
                  index: index,
                  title: 'TERCERO',
                  value: 3,
                ),

                //AUTORIDAD
                RadioListButton(
                  width: size.width*0.24,
                  index: index,
                  title: 'AUTOR',
                  value: 4,
                ),

                //CLIENTES
                RadioListButton(
                  width: size.width*0.24,
                  index: index,
                  title: 'CLIENTE',
                  value: 5,
                ),

                //IMPORTACION
                if(gProvider.codCliente != '28463' && gProvider.codCliente != '30361')
                RadioListButton(
                  width: size.width*0.24,
                  index: index,
                  title: 'IMPO',
                  value: 6,
                ),

                //EXPORTACION
                if(gProvider.codCliente != '28463' && gProvider.codCliente != '30361')
                RadioListButton(
                  width: size.width*0.24,
                  index: index,
                  title: 'EXPO',
                  value: 7,
                ),            

              ],

            ),

          )

        ],

      ),

    );
  
  }

}