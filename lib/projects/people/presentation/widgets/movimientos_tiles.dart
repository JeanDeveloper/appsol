import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/helpers/get_image.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/people/domain/helpers/consultar_doi_people.dart';
import 'package:solgis/projects/people/domain/models/movimiento_model.dart';
import 'package:solgis/projects/people/styles/style.dart';

class MovimientosTiles extends StatelessWidget {

  final Future<List<MovimientoModel>> movimientos;  

  const MovimientosTiles({
    Key? key, 
    required this.movimientos, 
  }) : super(key: key);
  

  //IRA LA CONDICION SI VA HACER EL MOVIMIENTO DENTRO DE PLANTA O MOVIMIENTO DEL DIA
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(

      future:movimientos,

      builder: (BuildContext context, AsyncSnapshot <List<MovimientoModel>>  snapshot) {

        if(!snapshot.hasData) return const Center(child: CircularProgressIndicator(color: Colors.blue));

        if(snapshot.data!.isEmpty) {
          
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.hourglass_empty_rounded),
              Text('No hay movimientos', style: TextStyle(color: Colors.black, fontSize: 12))
            ],
          );

        }

        return ListView.separated(
          separatorBuilder: ( _ , int i) => Divider(color: Colors.grey.shade500.withOpacity(0.5), indent: 10, endIndent: 10, height: 0 ),
          itemCount: snapshot.data!.length,
          itemBuilder: (_, i) => _ListTileMovimiento( movimiento: snapshot.data![i] )
          // itemBuilder: ( _, i) {

          //   return _ListTileMovimiento( movimiento: snapshot.data![i] );
          // }
        );

      },
    );

  }

}

class _ListTileMovimiento extends StatelessWidget {

  final MovimientoModel movimiento;
  const _ListTileMovimiento({Key? key, required this.movimiento}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final globalProvider  = Provider.of<GlobalProvider>(context);

    return ListTile(

      style: ListTileStyle.list,

      leading: GestureDetector(
        onTap: ()async{
          await NDialog(
            dialogStyle: DialogStyle(
              backgroundColor: const Color(0xFF999999), //0xFF9E9E9E
            ),
            title: Text('Foto de ${movimiento.nombres != '' ?

              movimiento.nombres!.split(' ')
              .map((nombre){
                if(nombre != '') return nombre[0] + nombre.substring(1).toLowerCase();
              }).join(' ')
              : ''
              }',

              style: const TextStyle(
                color: Colors.black
              ), 
              maxLines: 1, 
              overflow: TextOverflow.ellipsis
            ),
            content: Container(
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              width: size.width*0.05,
              height: size.height*0.35,
              child:ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FutureBuilder(

                  future: getImage(movimiento.pathImage),

                  builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) { 
                    if(!snapshot.hasData){
                      return const Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/gifs/loader-gris.gif'),
                      );
                    }

                    return Container(
                      child: snapshot.data!,
                    );

                  }

                ),
              )
            )

          ).show(context);
        },

        child: Container(
          width: size.width* .08,
          height: size.height*0.4,
          alignment: Alignment.center,
          child: FaIcon(
            FontAwesomeIcons.circleUser, 
            color: (movimiento.sexo == 'M')?Colors.blueAccent : Colors.pinkAccent, 
            size: 40
          ),

        ),
      ),

      // leading: GestureDetector(
      //   onTap: ()async{
      //     await NDialog(
      //       dialogStyle: DialogStyle(
      //         backgroundColor: const Color(0xFF999999), //0xFF9E9E9E
      //       ),
      //       title: Text('Foto de ${movimiento.nombres != '' ?

      //         movimiento.nombres!.split(' ')
      //         .map((nombre){
      //           return nombre[0] + nombre.substring(1).toLowerCase();
      //         }).join(' ')
      //         : ''
      //         }',

      //         style: const TextStyle(
      //           color: Colors.black
      //         ), 
      //         maxLines: 1, 
      //         overflow: TextOverflow.ellipsis
      //       ),
      //       content: Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      //         width: size.width*0.05,
      //         height: size.height*0.35,
      //         child:ClipRRect(
      //           borderRadius: BorderRadius.circular(20),
      //           child: FutureBuilder(

      //             future: getImage(movimiento.pathImage),

      //             builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) { 
      //               if(!snapshot.hasData){
      //                 return const Image(
      //                   fit: BoxFit.cover,
      //                   image: AssetImage('assets/gifs/loader-gris.gif'),
      //                 );
      //               }

      //               return Container(
      //                 child: snapshot.data!,
      //               );

      //             }

      //           ),
      //         )
      //       )

      //     ).show(context);
      //   },

      //   child: SizedBox(
      //     width: size.width*0.15,
      //     height: size.height*0.4,
      //     child: ClipRRect(

      //       borderRadius: BorderRadius.circular(20),

      //       child: FutureBuilder(

      //         future: getImage(movimiento.pathImage),

      //         builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
      //           if(!snapshot.hasData){
      //             return const Image(
      //               fit: BoxFit.cover,
      //               image: AssetImage('assets/gifs/loader-gris.gif'),
      //             );
      //           }

      //           return Container(
      //             child: snapshot.data!,
      //           );

      //         }

      //       ),

      //     ),

      //   ),
      // ),

      title: Row(

        children: [

          Expanded(
            flex: 7,
            child: Text( movimiento.nombres != '' 
                          ? movimiento.nombres!.split(' ')
                            .map((nombre) {
                              if (nombre == '') return null;
                              return nombre[0] + nombre.substring(1).toLowerCase();
                            })
                            .join(' ')
                          :'', 
                    style: styleLetterpersonalmovimientotitle(), 
                    overflow: TextOverflow.ellipsis, 
                    maxLines: 1
                    ),
          ),

          // const SizedBox(width: 10),

          // SizedBox(
          //   width: size.width*0.14,
          //   child: AutoSizeText(movimiento.dni!, style: styleLetterpersonalmovimientotitle() , maxLines: 1, minFontSize: 6, maxFontSize: 12,)
          // ),

          Expanded( flex: 2, child: AutoSizeText(movimiento.dni!, style: styleLetterpersonalmovimientotitle() , maxLines: 1, minFontSize: 6, maxFontSize: 12,))

        ],

      ),

      subtitle: Row(

        children: [

          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // AutoSizeText(movimiento.cargo!,minFontSize: 6, maxFontSize: 12, style: styleLetterpersonalmovimientosubtitle(),overflow: TextOverflow.ellipsis, maxLines: 2),

                AutoSizeText( movimiento.cargo != '' 
                  ? movimiento.cargo!.split(' ')
                    .map((c) {
                      if (c == '') return null;
                      return c[0] + c.substring(1).toLowerCase();
                    })
                    .join(' ')
                  :'' ,minFontSize: 6, maxFontSize: 12, style: styleLetterpersonalmovimientosubtitle(),overflow: TextOverflow.ellipsis, maxLines: 2),

                // AutoSizeText(movimiento.empresa!,minFontSize: 6, maxFontSize: 12, style: styleLetterpersonalmovimientosubtitle(),overflow: TextOverflow.ellipsis, maxLines: 2),

                AutoSizeText( movimiento.empresa != '' 
                  ? movimiento.empresa!.split(' ')
                    .map((empresa){
                      if (empresa == '') return null;
                      return empresa[0] + empresa.substring(1).toLowerCase();
                      })
                    .join(' ')
                  : '',
                  minFontSize: 4, maxFontSize: 12, style: styleLetterpersonalmovimientosubtitle().copyWith(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, maxLines: 2)

              ]

            ),
          ),

          if(movimiento.fechaSalida == '')
            Expanded( flex: 2 , child: AutoSizeText( movimiento.fechaMovimiento!.toString().substring(11, 19), style: TextStyle(color: Colors.red, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12,)),

          // if(movimiento.fechaSalida != '')
          //   Expanded( flex: 2 , child: AutoSizeText( movimiento.fechaSalida!.toString().substring(11, 16), style: TextStyle(color: Colors.green, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12)),

        ],

      ),

      trailing: (movimiento.fechaSalida == '')
        ? GestureDetector( 
          onTap: ()=>consultarDOI(context, movimiento.dni!, globalProvider.codServicio),
          child: const FaIcon(FontAwesomeIcons.personWalkingArrowRight, color: Colors.green),
        )
        : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AutoSizeText( movimiento.fechaMovimiento!.toString().substring(11, 19), style: TextStyle(color: Colors.red, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12),

            AutoSizeText( movimiento.fechaSalida!.toString().substring(11, 19), style: TextStyle(color: Colors.green, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12),

            // AutoSizeText( DateTime.parse(movimiento.fechaSalida!).toString(), style: TextStyle(color: Colors.blue, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12),

            AutoSizeText( getTiempoTranscurrido(movimiento.fechaMovimiento!, DateTime.parse('${movimiento.fechaSalida.toString().replaceAll(' ', 'T')}Z')).toString().substring(0, 7), style: TextStyle(color: Colors.blue, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12),

          ],
        ),  

      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    );

  }

}

Duration getTiempoTranscurrido(DateTime fecha1, DateTime fecha2){
  final Duration resultado = fecha2.difference(fecha1);
  return resultado;
}
