import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/helpers/get_image.dart';
import 'package:solgis/core/presentation/widgets/read_only_input.dart';
import 'package:solgis/projects/people/data/services/foto_acceso_service.dart';
import 'package:solgis/projects/people/domain/helpers/show_snackbar_awesome.dart';
import 'package:solgis/projects/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/projects/people/domain/models/datos_acceso_movimiento_model.dart';
import 'package:solgis/projects/people/domain/models/foto_acceso_model.dart';
import 'package:solgis/projects/people/domain/providers/salida_provider.dart';
import 'package:solgis/projects/people/domain/utils/dropdown_decorations.dart';
import 'package:solgis/projects/people/styles/style.dart';

class SalidaAutorizadaWidget extends StatelessWidget {
  
  final ConsultaModel consulta;
  final DatosAccesoMModel? datosAcceso;

  const SalidaAutorizadaWidget({
    required this.consulta, 
    required this.datosAcceso
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final salidaProvider  = Provider.of<SalidaProvider>(context);

    return Container(

      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: size.width*0.072),

      child: Form(

        key: salidaProvider.formKey,

        child: SingleChildScrollView(

          child: Column(

            children: [

              //CAMPO ENTRADA DE GUIA
              //MOSTRAR ESTE CAMPO SI EXISTE DATA

              if(datosAcceso != null && datosAcceso!.guiaMovimiento != '' )
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('E. GUIA:  ', style: styleCrearPersonaltextForm()),
                    if(datosAcceso!.fotoGuiaMovimiento != '')
                    SizedBox(width: size.width* 0.03),
                    
                    InputReadOnlyWidget(initialValue: datosAcceso!.guiaMovimiento, width: (datosAcceso!.fotoGuiaMovimiento == '') ? size.width*0.57 : size.width*0.43),

                    if(datosAcceso != null && datosAcceso!.fotoGuiaMovimiento != '')
                      GestureDetector(
                        onTap: ()async{
                          await NDialog(
                            dialogStyle: DialogStyle(
                              backgroundColor: const Color(0xFF999999), //0xFF9E9E9E
                            ),
                            title: const Text('Foto de Guia',
                              style:  TextStyle(
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

                                  future: FotoAccesoService.getFotoAcceso(datosAcceso!.fotoGuiaMovimiento!),

                                  builder: ( _ , AsyncSnapshot<FotoAccesoModel?> snapshot) {

                                    if(!snapshot.hasData) return Container();

                                    final fotoAcceso = snapshot.data;
                                    final path = fotoAcceso!.ubicacion;
                                    final pathsplit = fotoAcceso.ubicacion!.substring(path!.lastIndexOf(r'\') + 1);
                                    final pathImage = 'http://190.116.178.163:92/Photos/Guia/$pathsplit';
                                    
                                    return FutureBuilder(
                                      future: getImage(pathImage),
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

                                    );

                                  },

                                ),

                              )
                            )

                          ).show(context);
                        },

                        child :const Icon(Icons.camera_alt_outlined) ,

                      ),

                  ]
                ),

              if(datosAcceso != null && (datosAcceso!.guiaMovimiento != '' || datosAcceso!.fotoGuiaMovimiento != ''))
                SizedBox(height: size.height*0.02), 

              //CAMPO ENTRADA DE MATERIAL
              //MOSTRAR ESTE CAMPO SI EXISTE DATA
              if(datosAcceso != null && datosAcceso!.materialMovimiento != '')
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('E. MATERIAL:  ', style: styleCrearPersonaltextForm()),
                    InputReadOnlyWidget(initialValue: datosAcceso!.materialMovimiento, width:(datosAcceso!.fotoMaterialMovimiento == '') ? size.width*0.57 : size.width*0.43),
                    
                    if(datosAcceso != null && datosAcceso!.fotoMaterialMovimiento != '')
                      GestureDetector(
                        onTap: ()async{
                          await NDialog(
                            dialogStyle: DialogStyle(
                              backgroundColor: const Color(0xFF999999), //0xFF9E9E9E
                            ),
                            title: const Text('Foto de Material',
                              style:  TextStyle(
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

                                  future: FotoAccesoService.getFotoAcceso(datosAcceso!.fotoMaterialMovimiento!),

                                  builder: ( _ , AsyncSnapshot<FotoAccesoModel?> snapshot) {

                                    if(!snapshot.hasData) return Container();

                                    final fotoAcceso = snapshot.data;
                                    final path = fotoAcceso!.ubicacion;
                                    final pathsplit = fotoAcceso.ubicacion!.substring(path!.lastIndexOf(r'\') + 1);
                                    final pathImage = 'http://190.116.178.163:92/Photos/Material/$pathsplit';


                                    return FutureBuilder(

                                      future: getImage(pathImage),

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

                                    );

                                  },

                                ),

                              )
                            )

                          ).show(context);
                        },

                        child :const Icon(Icons.camera_alt_outlined) ,

                      ),

                  ]
                ),
              if(datosAcceso != null && (datosAcceso!.materialMovimiento != '' || datosAcceso!.fotoMaterialMovimiento != ''))
                SizedBox(height: size.height*0.02), 

              //CAMPOS A INGRESAR 
              //CAMPO GUIA
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Text('GUIA:  ', style: styleCrearPersonaltextForm()),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      SizedBox(
                        width: size.width*0.43,
                        // width: size.width*0.57,
                        height: size.height*0.04,
                        child: TextFormField(
                          cursorHeight: 20,
                          onChanged: (value){
                            salidaProvider.guia = value;
                            // ingresoProvider.material_valor = value;
                          },
                          style: const TextStyle(fontSize: 16, color: Colors.black),
                          decoration:inputDecorationDatos() ,
                        )
                      ),

                      CameraButton(campo: 'guia')


                      // IconButton(
                      //   alignment: Alignment.centerRight,
                      //   padding: EdgeInsets.zero,
                      //   icon: const Icon(Icons.camera_alt_outlined, color: Colors.black),

                      //   onPressed: ()async{

                      //     try {
                      //       //inicia camara
                      //       final ImagePicker _picker = ImagePicker();
                      //       final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

                      //       if(photo == null) {

                      //         // ignore: use_build_context_synchronously
                      //         return showSnackBarAwesome(context, '¡Atencion!', 'No se ha capturado ninguna imagen', ContentType.failure);
                      //       }else{

                      //         print(photo.path);
                      //         // ignore: use_build_context_synchronously
                      //         showSnackBarAwesome(context, '¡Atencion!', 'La imagen ha sido guardada', ContentType.success);

                      //       }

                      //     } catch (e) {

                      //       showSnackBarAwesome(context, '¡Atencion!', ' ${e}', ContentType.failure);


                      //     }

                      //   }, 

                      // )

                    ],
                  )

                ]
              ),

              SizedBox(height: size.height*0.02), 

              //CAMPO MATERIAL DE VALOR
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Text('MATERIAL:  ', style: styleCrearPersonaltextForm(), maxLines: 1),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      SizedBox(

                        width: size.width*0.43,
                        height: size.height*0.04,

                        child: TextFormField(
                          textCapitalization: TextCapitalization.characters,
                          cursorHeight: 20,
                          onChanged: (value){
                            // salidaProvider.materialValor = value;
                            salidaProvider.materialValor = value;

                          },
                          style: const TextStyle(fontSize: 16, color: Colors.black),
                          decoration:inputDecorationDatos(),

                        )

                      ),


                      CameraButton(campo: 'material')


                      // IconButton(

                      //   alignment: Alignment.centerRight,
                      //   padding: EdgeInsets.zero,                         
                      //   icon: const Icon(Icons.camera_alt_outlined, color: Colors.black),
                      //   onPressed: ()async{

                      //     try {

                      //       //inicia camara
                      //       final ImagePicker _picker = ImagePicker();
                      //       final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

                      //       if(photo == null) {
                      //         // ignore: use_build_context_synchronously
                      //         showSnackBarAwesome(context, '¡Atencion!', 'No se ha capturado ninguna imagen', ContentType.failure);
                      //       }else{
                      //         print(photo);
                      //         print(photo.path);

                      //         // ignore: use_build_context_synchronously
                      //         showSnackBarAwesome(context, '¡Atencion!', 'La imagen ha sido guardada', ContentType.success);
                      //       }

                      //     } catch (e) {
                            
                      //       showSnackBarAwesome(context, '¡Atencion!', 'Permiso de camara necesario para tomar la foto ', ContentType.failure);
                      //       print(e);
                            
                      //     }
                      //   }, 

                      // )
                    
                    
                    
                    ],
                  )

                ]

              ),

              // //CAMPO FOTO DE ENTRADA
              // Column(
              //   children: [
              //     Text('FOTO DE INGRESO', style: styleCrearPersonaltextForm()),
              //     //FOTO DE INGRESO, CARGARÁ SI EXISTE.
              //     SizedBox(height: size.height*0.005),

              //     // FOTO
              //     FutureBuilder(

              //       future: getImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1XOvYx-KTCr6ebZCGZvDkkTeqF0_pdmj5PYO1cUYLHfFepVPPIXGtkFX9nXgupBZGzrU&usqp=CAU'),
              //       // future: getImage(),
              //       builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
              //         if(!snapshot.hasData){
              //           return ClipRRect(
              //             borderRadius: BorderRadius.circular(20),
              //             child: SizedBox(
              //               width: size.width*0.30,
              //               height: size.width*0.30,
              //               child: const Image(
              //                 image: AssetImage('assets/gifs/loader.gif'),
              //               ),
              //             ),
              //           );
              //         }
              //         return ClipRRect(
              //           borderRadius: BorderRadius.circular(20),
              //           child: SizedBox(
              //             width: size.width*0.30,
              //             height: size.width*0.30,
              //             child: snapshot.data,
                        
              //           ),
              //         );
              //       }
              //     ),

              //   ],
              // ),

            ],

          ),
        ),
      ),
    );
  }

}

class CameraButton extends StatelessWidget {
  final String campo;
  const CameraButton({
    required this.campo,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final salidaProvider = Provider.of<SalidaProvider>(context);
    final size = MediaQuery.of(context).size;
    return IconButton(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.camera_alt_outlined, 
        color:(
          (campo == 'guia' ? salidaProvider.guia : salidaProvider.materialValor) == '')
            ? Colors.grey 
            : ( campo == 'guia' ? salidaProvider.fotoGuia : salidaProvider.fotoMaterialValor ) == null
              ? Colors.black
              : Colors.green
      ),

      onPressed:((campo == 'guia' ? salidaProvider.guia : salidaProvider.materialValor) == '')
        ? null 

        : ((campo == 'guia') ? salidaProvider.fotoGuia : salidaProvider.fotoMaterialValor) != null
          ? () async{
            await NDialog(
              dialogStyle: DialogStyle(backgroundColor: const Color(0xFF999999)),
              title: Text(
                (campo=='guia')
                  ? 'Foto de Guia'
                  : 'Foto de Material',
                style:  const TextStyle( color: Colors.black), 
                maxLines: 1, 
                overflow: TextOverflow.ellipsis
              ),
              content: SizedBox(
                width: size.width*0.5,
                height: size.height*0.5,
                child:Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FutureBuilder(
                          future: getImage((campo == 'guia') ? salidaProvider.fotoGuia!.path : salidaProvider.fotoMaterialValor!.path),
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
                    TextButton(
                      child: const Text('Eliminar', style: TextStyle(color: Colors.black),),
                      onPressed: (){
                        if(campo == 'guia'){
                          salidaProvider.fotoGuia = null;
                        }else{
                          salidaProvider.fotoMaterialValor = null;
                        }
                        Navigator.pop(context);
                      }, 
                    ),
                  ],
                )
              )
            ).show(context);
          }

          : () async {

            //inicia camara
            final ImagePicker picker = ImagePicker();
            final XFile? pickerPhoto = await picker.pickImage(
              source: ImageSource.camera,
              imageQuality: 25
            );
            // ignore: use_build_context_synchronously
            if(pickerPhoto == null) return showSnackBarAwesome(context, '¡Atencion!', 'No se ha capturado imagen', ContentType.failure);
            (campo == 'guia' ? salidaProvider.fotoGuia =pickerPhoto : salidaProvider.fotoMaterialValor= pickerPhoto); 
            // ignore: use_build_context_synchronously
            showSnackBarAwesome(context, '¡Atencion!', 'La imagen ha sido guardada', ContentType.success);
          },

    );
  }
}
