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

class ListTileMovimiento extends StatelessWidget {

  final MovimientoModel movimiento;
  const ListTileMovimiento(
    {Key? key, 
    required this.movimiento, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final globalProvider  = Provider.of<GlobalProvider>(context);

    return GestureDetector(
      onTap: ()=> Navigator.pushNamed(context, 'detalle_movimiento', arguments: movimiento) ,

      child: ListTile(

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
    
            Expanded( flex: 2, child: AutoSizeText(movimiento.dni!, style: styleLetterpersonalmovimientotitle() , maxLines: 1, minFontSize: 6, maxFontSize: 12,))
    
          ],
    
        ),
    
        subtitle: Row(
    
          children: [
    
            Expanded(
              flex:5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  AutoSizeText( movimiento.cargo != '' 
                    ? movimiento.cargo!.split(' ')
                      .map((c) {
                        if (c == '') return null;
                        return c[0] + c.substring(1).toLowerCase();
                      })
                      .join(' ')
                    :'' ,minFontSize: 6, maxFontSize: 12, style: styleLetterpersonalmovimientosubtitle(),overflow: TextOverflow.ellipsis, maxLines: 2),

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

            Expanded( 
              flex: (movimiento.guiaMov == '' && movimiento.materialMov == '') ? 2 : (movimiento.guiaMov != '' || movimiento.materialMov != '')? 1 :  0, 
              child: const SizedBox(), 
            ),
    
            if(movimiento.guiaMov != '' )
              const Expanded( flex: 1 , child: Icon(Icons.library_books_outlined, size: 18)),
    
            if(movimiento.materialMov != '' )
              const Expanded( flex: 1 , child: Icon(Icons.diamond, size: 18)),
    
            if(movimiento.fechaSalida == '')
              Expanded( flex: 2 , child: AutoSizeText( movimiento.fechaMovimiento!.toString().substring(11, 19), style: TextStyle(color: Colors.green, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12,)),

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
              AutoSizeText( movimiento.fechaMovimiento!.toString().substring(11, 19), style: TextStyle(color: Colors.green, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12),
              AutoSizeText( movimiento.fechaSalida!.toString().substring(11, 19), style: TextStyle(color: Colors.red, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12),
              AutoSizeText( getTiempoTranscurrido(movimiento.fechaMovimiento!, DateTime.parse('${movimiento.fechaSalida.toString().replaceAll(' ', 'T')}Z')).toString().substring(0, 7), style: TextStyle(color: Colors.blue, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12),
            ],
          ),  
    
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      ),
    );

  }


  Duration getTiempoTranscurrido(DateTime fecha1, DateTime fecha2){
    final Duration resultado = fecha2.difference(fecha1);
    return resultado;
  }


}

