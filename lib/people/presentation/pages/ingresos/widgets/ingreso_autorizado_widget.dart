import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:solgis/people/domain/helpers/show_snackbar_awesome.dart';
import 'package:solgis/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/people/domain/providers/ingreso_autorizado_provider.dart';
import 'package:solgis/people/domain/utils/dropdown_decorations.dart';
import 'package:solgis/people/presentation/widgets/widgets.dart';
import 'package:solgis/theme/style_people.dart';

class IngresoAutorizadoWidget extends StatelessWidget {
  
  final ConsultaModel consulta;

  const IngresoAutorizadoWidget({required this.consulta});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final ingresoProvider = Provider.of<IngresoAutorizadoProvider>(context);

    return Container(

      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: size.width*0.072),

      child: Form(

        key: ingresoProvider.formKey,

        child: SingleChildScrollView(

          child: Column(

            children: [

              //CAMPO AUTORIZANTE
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text('AUTORIZANTES:', style: styleCrearPersonaltextForm()),

                  DropdownButtonWidget(

                    //if es propio el autorizante será por defecto el que viene con la consulta, caso contrario se tendrá que elegir entre los que se haga en la peticion http de autorizantes

                    items: (consulta.codigoAutorizante == 0) 
                      ? [] 
                      : [DropdownMenuItem(value: consulta.codigoAutorizante ,child: Text(consulta.autorizante!))], 
                    onchanged: (value) =>  (consulta.codigoAutorizante== 0) ? null : ingresoProvider.codautorizante=value!, 
                    value: consulta.codigoAutorizante,
                  )

                ],

              ),
              SizedBox(height: size.height*0.02),

              //CAMPO MOTIVO
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Text('MOTIVO:  ', style: styleCrearPersonaltextForm()),

                  DropdownButtonWidget(
                    // hintText: 'MOTIVOS DISPONIBLES', 
                    items: (consulta.codigoMotivo == -1)
                      ?[]
                      :[DropdownMenuItem(value: consulta.codigoMotivo, child: Text(consulta.motivo!))],
                    onchanged: (value) => (consulta.codigoMotivo== -1) ? null : ingresoProvider.codmotivo=value!,
                    value: consulta.codigoMotivo,
                  ),

                ],

              ),
              SizedBox(height: size.height*0.02), 
              
              //CAMPO ACCESO
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
                children: [
          
                  Text('ACCESO:  ', style: styleCrearPersonaltextForm().copyWith(fontSize: 14)),

                  DropdownButtonWidget(

                    items:(consulta.codigoArea == 0)
                      ? []
                      :[DropdownMenuItem(value:consulta.codigoArea, child: Text(consulta.area!))],
                    onchanged: (value) =>(consulta.codigoArea == 0) ? null : ingresoProvider.codarea = value!,
                    value: consulta.codigoArea,
                  ),
              
                ],


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
                          cursorHeight: 20,
                          onChanged: (value)=>
                            ingresoProvider.guia = value,
                          style: const TextStyle(fontSize: 16, color: Colors.black),
                          decoration:inputDecorationDatos() ,
                        )
                      ),

                      IconButton(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.zero,

                        icon: const Icon(Icons.camera_alt_outlined, color: Colors.black),
                        
                        onPressed: ()async{

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

                  Text('MATERIAL:  ', style: styleCrearPersonaltextForm(), maxLines: 2),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      SizedBox(

                        width: size.width*0.45,
                        height: size.height*0.04,

                        child: TextFormField(
                          cursorHeight: 20,
                          onChanged: (value) =>ingresoProvider.material_valor = value,
                          style: const TextStyle(fontSize: 16, color: Colors.black),
                          decoration:inputDecorationDatos(),

                        )

                      ),
                      

                      IconButton(

                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.zero,                         
                        icon: const Icon(Icons.camera_alt_outlined, color: Colors.black),
                        onPressed: ()async{

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

                        }, 

                      )

                    ],

                  )

                ]

              ),

            ],

          ),
          
        ),
      ),

    );

  }

}