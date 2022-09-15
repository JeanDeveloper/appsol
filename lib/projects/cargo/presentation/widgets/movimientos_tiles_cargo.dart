import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solgis/projects/cargo/data/models/movimiento_cargo_model.dart';

import 'package:solgis/projects/cargo/styles/style.dart';

class MovimientosTilesCargo extends StatelessWidget {

  final Future<List<MovimientoCargoModel>> movimientos;

  const MovimientosTilesCargo({
    Key? key, 
    required this.movimientos
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {


    return FutureBuilder(

      future: movimientos,

      builder: ( _ ,AsyncSnapshot <List<MovimientoCargoModel>> snapshot) {

        if(!snapshot.hasData) return const Center(child: CircularProgressIndicator(color: Colors.blue));

        if(snapshot.data!.isEmpty) return const Center(child: Text('NO HAY MOVIMIENTOS', style: TextStyle(color: Colors.black)));

        return ListView.separated(
          separatorBuilder: ( _ , int i) => const Divider(color:Colors.black, indent: 10, endIndent: 10),
          itemCount: snapshot.data!.length,
          itemBuilder: ( _ , i) => _ListTileMovimiento( movimientoCargo: snapshot.data![i] ),
        );

      },
    );

  }
}

class _ListTileMovimiento extends StatelessWidget {
  
  final MovimientoCargoModel movimientoCargo;
  const _ListTileMovimiento({required this.movimientoCargo});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ListTile(

      style: ListTileStyle.list,

      title: Row(

        children: [

          SizedBox(
            // color: Colors.red,
            width: size.width*0.11,
            child: Text(movimientoCargo.placa! ,  style: styleLetterpersonalmovimientotitle(), overflow: TextOverflow.ellipsis, maxLines: 1),
          ),
          
          Text('- ' ,  style: styleLetterpersonalmovimientotitle(), overflow: TextOverflow.ellipsis, maxLines: 1),
          SizedBox(
            width: size.width*0.6,
            child: Text(movimientoCargo.nombres!, style: styleLetterpersonalmovimientotitle(), overflow: TextOverflow.ellipsis, maxLines: 1),
          ),
          const SizedBox(width: 10),
        ],

      ),

      subtitle: Row(

        children: [

          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(movimientoCargo.cargo!, minFontSize: 6,  maxFontSize: 12 ,style: styleLetterpersonalmovimientosubtitle(), overflow: TextOverflow.ellipsis, maxLines: 2),
                AutoSizeText(movimientoCargo.empresa!, minFontSize: 4, maxFontSize: 12 , style: styleLetterpersonalmovimientosubtitle().copyWith(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, maxLines: 2),
                AutoSizeText(movimientoCargo.tipoCarga!, minFontSize: 4, maxFontSize: 12 , style: styleLetterpersonalmovimientosubtitle().copyWith( color: Colors.blue, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, maxLines: 2)
              ]
            ),
          ),

          if(movimientoCargo.fechaSalida == '')
            Expanded( flex: 2 , child: AutoSizeText( movimientoCargo.fechaIngreso!.toString().substring(11, 19), style: TextStyle(color: Colors.red, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12,)),

          // if(movimiento.fechaSalida != '')
          //   Expanded( flex: 2 , child: AutoSizeText( movimiento.fechaSalida!.toString().substring(11, 16), style: TextStyle(color: Colors.green, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12)),

        ],
      ),

      trailing: (movimientoCargo.fechaSalida== '')
        ? const FaIcon(FontAwesomeIcons.personWalkingArrowRight, color: Colors.green,)
        : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(movimientoCargo.fechaIngreso!.toString(), style: TextStyle(color: Colors.red, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12),
            AutoSizeText(movimientoCargo.fechaSalida.toString(), style: TextStyle(color: Colors.green, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12),
            AutoSizeText(  getTiempoTranscurrido(movimientoCargo.fechaIngreso!,  DateTime.parse('${movimientoCargo.fechaSalida.toString().replaceAll(' ', 'T')}Z')).toString().substring(0, 7)),
          ],

        ),

      contentPadding:  const EdgeInsets.symmetric(horizontal: 10),

    );

  }



  
}



Duration getTiempoTranscurrido(DateTime fecha1, DateTime fecha2){
  final Duration resultado = fecha2.difference(fecha1);
  return resultado;
}


