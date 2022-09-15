import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/presentation/widgets/read_only_input.dart';
import 'package:solgis/projects/people/domain/helpers/show_snackbar_awesome.dart';
import 'package:solgis/projects/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/projects/people/domain/models/datos_acceso_movimiento_model.dart';
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

              if(datosAcceso != null && (datosAcceso!.guiaMovimiento != '' || datosAcceso!.fotoGuiaMovimiento != ''))
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('E. GUIA:  ', style: styleCrearPersonaltextForm()),
                    InputReadOnlyWidget(initialValue: datosAcceso!.guiaMovimiento)
                    // const FaIcon(FontAwesomeIcons.book, color: Colors.blue),
                  ]
                ),

              if(datosAcceso != null && (datosAcceso!.guiaMovimiento != '' || datosAcceso!.fotoGuiaMovimiento != ''))
                SizedBox(height: size.height*0.02), 

              //CAMPO ENTRADA DE MATERIAL
              //MOSTRAR ESTE CAMPO SI EXISTE DATA
              if(datosAcceso != null && (datosAcceso!.materialMovimiento != '' || datosAcceso!.fotoMaterialMovimiento != ''))
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('E. MATERIAL:  ', style: styleCrearPersonaltextForm()),
                    InputReadOnlyWidget(initialValue: datosAcceso!.materialMovimiento)
                  ]
                ),
              if(datosAcceso != null && (datosAcceso!.materialMovimiento != '' || datosAcceso!.fotoMaterialMovimiento != ''))
                SizedBox(height: size.height*0.02), 

              //CAMPO GUIA
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [

                  Text('GUIA:  ', style: styleCrearPersonaltextForm()),

                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      SizedBox(
                        width: size.width*0.43,
                        height: size.height*0.04,
                        child: TextFormField(
                          cursorHeight: 20,
                          onChanged: (value){
                            print(value);
                            salidaProvider.guia = value;
                            // ingresoProvider.material_valor = value;
                          },
                          style: const TextStyle(fontSize: 16, color: Colors.black),
                          decoration:inputDecorationDatos() ,
                        )
                      ),

                      IconButton(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.camera_alt_outlined, color: Colors.black),

                        onPressed: ()async{

                          try {
                            //inicia camara
                            final ImagePicker _picker = ImagePicker();
                            final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

                            if(photo == null) {

                              // ignore: use_build_context_synchronously
                              return showSnackBarAwesome(context, '¡Atencion!', 'No se ha capturado ninguna imagen', ContentType.failure);
                            }else{

                              print(photo.path);
                              // ignore: use_build_context_synchronously
                              showSnackBarAwesome(context, '¡Atencion!', 'La imagen ha sido guardada', ContentType.success);

                            }

                          } catch (e) {

                            showSnackBarAwesome(context, '¡Atencion!', ' ${e}', ContentType.failure);


                          }

                        }, 

                      )

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
                            print(value);
                            // salidaProvider.materialValor = value;
                            salidaProvider.materialValor = value;

                          },
                          style: const TextStyle(fontSize: 16, color: Colors.black),
                          decoration:inputDecorationDatos(),

                        )

                      ),


                      IconButton(

                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.zero,                         
                        icon: const Icon(Icons.camera_alt_outlined, color: Colors.black),
                        onPressed: ()async{

                          try {

                            //inicia camara
                            final ImagePicker _picker = ImagePicker();
                            final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

                            if(photo == null) {
                              // ignore: use_build_context_synchronously
                              showSnackBarAwesome(context, '¡Atencion!', 'No se ha capturado ninguna imagen', ContentType.failure);
                            }else{
                              print(photo);
                              print(photo.path);

                              // ignore: use_build_context_synchronously
                              showSnackBarAwesome(context, '¡Atencion!', 'La imagen ha sido guardada', ContentType.success);
                            }

                          } catch (e) {
                            
                            showSnackBarAwesome(context, '¡Atencion!', 'Permiso de camara necesario para tomar la foto ', ContentType.failure);
                            print(e);
                            
                          }
                        }, 

                      )
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