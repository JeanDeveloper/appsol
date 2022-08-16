import 'dart:math';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:solgis/people/domain/helpers/get_image.dart';
import 'package:solgis/people/domain/helpers/show_snackbar_awesome.dart';
import 'package:solgis/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/people/domain/providers/salida_provider.dart';
import 'package:solgis/people/domain/utils/dropdown_decorations.dart';
import 'package:solgis/people/presentation/widgets/widgets.dart';
import 'package:solgis/theme/style_people.dart';

class SalidaAutorizadaWidget extends StatelessWidget {
  
  final ConsultaModel consulta;

  const SalidaAutorizadaWidget({required this.consulta});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final salidaProvider = Provider.of<SalidaProvider>(context);

    return Container(

      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: size.width*0.072),

      child: Form(

        key: salidaProvider.formKey,

        child: SingleChildScrollView(

          child: Column(

            children: [

              //CAMPO SERIE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('SERIE:  ', style: styleCrearPersonaltextForm()),
                  const InputReadOnlyWidget(initialValue: '')
                ]
              ),
              SizedBox(height: size.height*0.02), 


              //CAMPO GUIA
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [

                  Text('GUIA:  ', style: styleCrearPersonaltextForm()),

                  Row(

                    children: [

                      SizedBox(
                        width: size.width*0.45,
                        height: size.height*0.04,
                        child: TextFormField(
                          textCapitalization: TextCapitalization.characters,
                          cursorHeight: 20,
                          onChanged: (value)=>
                            salidaProvider.guia = value,
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
                              showSnackBarAwesome(context, '¡Atencion!', 'No se ha capturado ninguna imagen', ContentType.failure);
                            }else{

                              print(photo);
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

                        width: size.width*0.45,
                        height: size.height*0.04,

                        child: TextFormField(
                          textCapitalization: TextCapitalization.characters,
                          cursorHeight: 20,
                          onChanged: (value) =>salidaProvider.materialValor = value,
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


              //CAMPO FOTO DE ENTRADA
              Column(
                children: [
                  Text('FOTO DE INGRESO', style: styleCrearPersonaltextForm()),
                  //FOTO DE INGRESO, CARGARÁ SI EXISTE.
                  SizedBox(height: size.height*0.005),

                  // FOTO
                  FutureBuilder(

                    future: getImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1XOvYx-KTCr6ebZCGZvDkkTeqF0_pdmj5PYO1cUYLHfFepVPPIXGtkFX9nXgupBZGzrU&usqp=CAU'),
                    // future: getImage(),
                    builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                      if(!snapshot.hasData){
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            width: size.width*0.30,
                            height: size.width*0.30,
                            child: const Image(
                              image: AssetImage('assets/gifs/loader.gif'),
                            ),
                          ),
                        );
                      }
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          width: size.width*0.30,
                          height: size.width*0.30,
                          child: snapshot.data,
                        
                        ),
                      );
                    }
                  ),

                ],
              ),

            ],

          ),
          
        ),
      ),

    );

  }

}