
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:solgis/home/domain/providers/global_provider.dart';
import 'package:solgis/people/domain/helpers/get_image.dart';
import 'package:solgis/people/domain/models/movimiento_model.dart';
import 'package:solgis/people/domain/helpers/consultar_doi_people.dart';
import 'package:solgis/theme/style_people.dart';

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

        if(!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator(color: Colors.blue));
        }

        if(snapshot.data!.isEmpty) {
          return  const Center(
              child: Text('NO HAY MOVIMIMENTOS', style: TextStyle(color: Colors.black),),
            );
        }

        return RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.separated(
            
            separatorBuilder: ( _ , int i) => const Divider(color: Colors.black, indent: 10, endIndent: 10),
            itemCount: snapshot.data!.length,
            itemBuilder: ( _, i) => _ListTileMovimiento( movimiento: snapshot.data![i] )
            
          ),
        );

      },

    );

  
  }

  Future<void> onRefresh()async{
    await movimientos;
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
      // leading:Icon(Icons.account_circle, size: size.width*0.1, color: (movimiento.sexo == 'M')? Colors.blue :  Colors.pinkAccent),
      leading: GestureDetector(
        onTap: ()async{

          await NDialog(
            
            dialogStyle: DialogStyle(
              backgroundColor: const Color(0xFF999999), //0xFF9E9E9E
            ),
            
            title: Text('FOTO DE ${movimiento.nombres}', style: const TextStyle(color: Colors.black), maxLines: 1, overflow: TextOverflow.ellipsis),
            
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
        child: SizedBox(
          width: size.width*0.15,
          height: size.height*0.4,
          child: ClipRRect(
      
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
      
          ),
      
        ),
      ),

      // leading:Container(
      //   width: size.width*0.15,
      //   height: size.height*0.4,
      //   color: Colors.red,
      // ),



      title: Row(

        children: [

          SizedBox(
            width: size.width*0.40,
            child: AutoSizeText(movimiento.nombres!,style: styleLetterpersonalmovimientotitle(), overflow: TextOverflow.ellipsis, maxLines: 1)
          ),

          const SizedBox(width: 10),

          Expanded(child: AutoSizeText(movimiento.dni!, style: styleLetterpersonalmovimientotitle(), maxLines: 1))

        ],

      ),

      subtitle: Row(

        children: [
          // AÑADIMOS EXPANDED Y COMENTAMOS LA FOTO
          Expanded(
            flex: 7,
            child: SizedBox(
          
              width: size.width*0.31,
              
              child: Column(
              
                crossAxisAlignment: CrossAxisAlignment.start,
              
                children: [
              
                  AutoSizeText(movimiento.cargo!, minFontSize: 6,  maxFontSize: 12 ,style: styleLetterpersonalmovimientosubtitle(), overflow: TextOverflow.ellipsis, maxLines: 2),
                  AutoSizeText(movimiento.empresa!, minFontSize: 4, maxFontSize: 12 , style: styleLetterpersonalmovimientosubtitle().copyWith(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, maxLines: 2,)
              
                ]
              
              ),
          
            ),
          ),

          // IconButton(

          //   icon: Icon(Icons.camera_alt_outlined, size:  size.width*0.06,),

          //   onPressed: ()async{

          //     await NDialog(
                
          //       dialogStyle: DialogStyle(
          //         backgroundColor: const Color(0xFF999999), //0xFF9E9E9E
          //       ),
                
          //       title: Text('FOTO DE ${movimiento.nombres}', style: const TextStyle(color: Colors.black), maxLines: 1, overflow: TextOverflow.ellipsis),
                
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

          // ),

          // SizedBox(width: size.width*0.15),

          Expanded( flex: 3, child: AutoSizeText( movimiento.fechaMovimiento!.toString().substring(11, 16), style: TextStyle(color: Colors.red, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12,))

        ],

      ),

      trailing: (movimiento.fechaSalida == '')
        ? GestureDetector( 
          onTap: ()async{

            consultarDOI(context, movimiento.dni!, globalProvider.codServicio);
          },
          child: Text('DAR SALIDA', style: TextStyle(color: Colors.green, fontSize: size.width*0.03))
        )
        :null,

      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    
    );
  }
}