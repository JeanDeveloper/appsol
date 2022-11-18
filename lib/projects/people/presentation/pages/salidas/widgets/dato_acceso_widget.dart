import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:solgis/core/domain/helpers/get_image.dart';
import 'package:solgis/projects/cargo/styles/style.dart';
import 'package:solgis/projects/people/domain/models/datos_acceso_movimiento_model.dart';
import 'package:solgis/projects/people/presentation/widgets/widgets.dart';

class DatoAccesoWidget extends StatelessWidget {

  final List<DatoAccesoMModel>? datos;

  const DatoAccesoWidget({super.key, this.datos});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Column(

      children: _showDatos(datos!, size, context),

    );

    
  }
}

  List<Widget> _showDatos(List<DatoAccesoMModel> datos, Size size, BuildContext context)=> datos.map((dato) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical:size.height * .02 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(
            (dato.codTipoDatoAcceso == 1) ? 'E. Guia:  ' : 'E. Material:  ', 
            style: styleCrearPersonaltextForm()
          ),

          if(dato.pathImage != '')
            SizedBox(width: (dato.codTipoDatoAcceso == 1) ?size.width* 0.03 : null ),

          InputReadOnlyWidget(
            initialValue: dato.descripcion, 
            width: (dato.pathImage == '') 
              ? size.width*0.57 
              : size.width*0.43
          ),

          if(dato.pathImage != '')

            GestureDetector(

              onTap: ()async{

                await NDialog(
                  dialogStyle: DialogStyle(
                    backgroundColor: const Color(0xFF999999), //0xFF9E9E9E
                  ),
                  title: Text('Foto de ${(dato.codTipoDatoAcceso == 1) ? "Guia" : "Material"}',
                    style:  const TextStyle(
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
                        future: getImage(dato.pathImage),
                        builder: ( _ , AsyncSnapshot<Widget> snapshot) {
                          if(!snapshot.hasData){
                            return const Image(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/gifs/loader-gris.gif'),
                            );
                          }

                          return Container(
                            child: snapshot.data!,
                          );

                        },

                      ),

                    )
                  )

                ).show(context);

              },

              child :const Icon(Icons.camera_alt_outlined) ,

            ),

        ],
      ),
    );

  }).toList();

              //CAMPO ENTRADA DE GUIA
              //MOSTRAR ESTE CAMPO SI EXISTE DATA

              // if(datosAcceso != null && datosAcceso!.guiaMovimiento != '' )
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text('E. GUIA:  ', style: styleCrearPersonaltextForm()),
                //     if(datosAcceso!.fotoGuiaMovimiento != '')
                //     SizedBox(width: size.width* 0.03),
                //     InputReadOnlyWidget(initialValue: datosAcceso!.guiaMovimiento, width: (datosAcceso!.fotoGuiaMovimiento == '') ? size.width*0.57 : size.width*0.43),

                //     if(datosAcceso != null && datosAcceso!.fotoGuiaMovimiento != '')
                //       GestureDetector(
                //         onTap: ()async{
                //           await NDialog(
                //             dialogStyle: DialogStyle(
                //               backgroundColor: const Color(0xFF999999), //0xFF9E9E9E
                //             ),
                //             title: const Text('Foto de Guia',
                //               style:  TextStyle(
                //                 color: Colors.black
                //               ), 
                //               maxLines: 1, 
                //               overflow: TextOverflow.ellipsis
                //             ),
                //             content: Container(
                //               margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                //               width: size.width*0.05,
                //               height: size.height*0.35,
                //               child:ClipRRect(
                //                 borderRadius: BorderRadius.circular(20),
                //                 child: FutureBuilder(

                //                   future: FotoAccesoService.getFotoAcceso(datosAcceso!.fotoGuiaMovimiento!),

                //                   builder: ( _ , AsyncSnapshot<FotoAccesoModel?> snapshot) {

                //                     if(!snapshot.hasData) return Container();

                //                     final fotoAcceso = snapshot.data;
                //                     final path = fotoAcceso!.ubicacion;
                //                     final pathsplit = fotoAcceso.ubicacion!.substring(path!.lastIndexOf(r'\') + 1);
                //                     final pathImage = 'http://190.116.178.163:92/Photos/Guia/$pathsplit';

                //                     return FutureBuilder(
                //                       future: getImage(pathImage),
                //                       builder: ( _ , AsyncSnapshot<Widget> snapshot) {
                //                         if(!snapshot.hasData){
                //                           return const Image(
                //                             fit: BoxFit.cover,
                //                             image: AssetImage('assets/gifs/loader-gris.gif'),
                //                           );
                //                         }

                //                         return Container(
                //                           child: snapshot.data!,
                //                         );
                //                       },

                //                     );

                //                   },

                //                 ),

                //               )
                //             )

                //           ).show(context);
                //         },

                //         child :const Icon(Icons.camera_alt_outlined) ,

                //       ),

                //   ]
                // ),

              // if(datosAcceso != null && (datosAcceso!.guiaMovimiento != '' || datosAcceso!.fotoGuiaMovimiento != ''))
              //   SizedBox(height: size.height*0.02), 

              // //CAMPO ENTRADA DE MATERIAL
              // //MOSTRAR ESTE CAMPO SI EXISTE DATA
              // if(datosAcceso != null && datosAcceso!.materialMovimiento != '')
              //   Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text('E. MATERIAL:  ', style: styleCrearPersonaltextForm()),
              //       InputReadOnlyWidget(initialValue: datosAcceso!.materialMovimiento, width:(datosAcceso!.fotoMaterialMovimiento == '') ? size.width*0.57 : size.width*0.43),
                    
              //       if(datosAcceso != null && datosAcceso!.fotoMaterialMovimiento != '')
              //         GestureDetector(
              //           onTap: ()async{
              //             await NDialog(
              //               dialogStyle: DialogStyle(
              //                 backgroundColor: const Color(0xFF999999), //0xFF9E9E9E
              //               ),
              //               title: const Text('Foto de Material',
              //                 style:  TextStyle(
              //                   color: Colors.black
              //                 ), 
              //                 maxLines: 1, 
              //                 overflow: TextOverflow.ellipsis
              //               ),
              //               content: Container(
              //                 margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              //                 width: size.width*0.05,
              //                 height: size.height*0.35,
              //                 child:ClipRRect(
              //                   borderRadius: BorderRadius.circular(20),
              //                   child: FutureBuilder(

              //                     future: FotoAccesoService.getFotoAcceso(datosAcceso!.fotoMaterialMovimiento!),

              //                     builder: ( _ , AsyncSnapshot<FotoAccesoModel?> snapshot) {

              //                       if(!snapshot.hasData) return Container();

              //                       final fotoAcceso = snapshot.data;
              //                       final path = fotoAcceso!.ubicacion;
              //                       final pathsplit = fotoAcceso.ubicacion!.substring(path!.lastIndexOf(r'\') + 1);
              //                       final pathImage = 'http://190.116.178.163:92/Photos/Material/$pathsplit';


              //                       return FutureBuilder(

              //                         future: getImage(pathImage),

              //                         builder: ( _ , AsyncSnapshot<Widget> snapshot) {
              //                           if(!snapshot.hasData){
              //                             return const Image(
              //                               fit: BoxFit.cover,
              //                               image: AssetImage('assets/gifs/loader-gris.gif'),
              //                             );
              //                           }

              //                           return Container(
              //                             child: snapshot.data!,
              //                           );

              //                         },

              //                       );

              //                     },

              //                   ),

              //                 )
              //               )

              //             ).show(context);
              //           },

              //           child :const Icon(Icons.camera_alt_outlined) ,

              //         ),

              //     ]
              //   ),
              // if(datosAcceso != null && (datosAcceso!.materialMovimiento != '' || datosAcceso!.fotoMaterialMovimiento != ''))
              //   SizedBox(height: size.height*0.02), 
