import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/helpers/check_image_ingreso_autorizado.dart';
import 'package:solgis/projects/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/projects/people/domain/providers/ingreso_autorizado_provider.dart';
import 'package:solgis/projects/people/presentation/widgets/widgets.dart';
import 'package:solgis/projects/people/styles/style.dart';

class ConstantesWidgetEntrada extends StatelessWidget {

  final ConsultaModel consulta;

  const ConstantesWidgetEntrada({
    Key? key, 
    required this.consulta
  }) : super(key: key) ;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final ingresoProvider = Provider.of<IngresoAutorizadoProvider?>(context);

    return Container(

      padding: EdgeInsets.symmetric(horizontal: size.width*0.0729, vertical: size.height*0.0116),
      width: double.infinity,
      height: size.height * 0.43,

      child: Column(

        children: [

          // FOTO
          FutureBuilder(
            future: checkImageStatus(consulta.img),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if(!snapshot.hasData){
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    width: size.width*0.33,
                    height: size.width*0.33,
                    child: const Image(image: AssetImage('assets/gifs/loader.gif')),
                  ),
                );
              }
              final int response = snapshot.data!;
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: size.width*0.33,
                  height: size.width*0.33,
                  child: (response == 1) 
                    ? Image(image: NetworkImage(consulta.img!), fit: BoxFit.fill)
                    : Stack(
                      fit: StackFit.expand,
                      children: [
                        (ingresoProvider==null || ingresoProvider.fotoPersonalUpdate ==null)
                          ?const Image( image: AssetImage('assets/pngs/no-image-rectangle.png'), fit: BoxFit.fill)
                          :Image.file(File( ingresoProvider.fotoPersonalUpdate!.path ),fit: BoxFit.fill,),
                        //CAMARA
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(  
                            icon:Icon(Icons.camera_alt, color: Colors.white, size: size.width*0.1),
                            onPressed: () async {  
                              final picker = ImagePicker();
                              final pickedFile = await picker.pickImage(
                                source: ImageSource.camera,
                                imageQuality: 25,
                              );
                              if ( pickedFile == null )return;
                              ingresoProvider!.updateImage(pickedFile.path);
                            }
                          )
                        )
                      ],
                    )
                ),
              );
            }
          ),

          SizedBox(height: size.height*0.02),

          //CAMPO DNI
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              Text( (consulta.tipoDocumento=='DNI')? 'DNI:' : (consulta.tipoDocumento=='PASAPORTE')? 'Pasaporte:': 'Carnet:', style: styleCrearPersonaltextForm()),
              InputReadOnlyWidget(initialValue: consulta.docPersona),

            ]

          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO NOMBRE
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              Text('Nombre:  ', style: styleCrearPersonaltextForm()),
              InputReadOnlyWidget(initialValue: consulta.nombresPersona),

            ]

          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO CARGO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Cargo:  ', style: styleCrearPersonaltextForm()),
              InputReadOnlyWidget(initialValue: consulta.cargo),
            ]
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO EMPRESA
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              Text('Empresa:  ', style: styleCrearPersonaltextForm()),
              InputReadOnlyWidget(initialValue: consulta.empresa)

            ]

          ),

        ],
      ),
    );
  }
}