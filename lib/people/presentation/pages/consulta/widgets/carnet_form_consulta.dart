import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/home/domain/providers/global_provider.dart';
import 'package:solgis/people/domain/helpers/show_snackbar_awesome.dart';
import 'package:solgis/people/domain/helpers/validar_consulta.dart';
import 'package:solgis/people/presentation/widgets/numpad2_people.dart';
import 'package:solgis/theme/style_people.dart';

class CarnetFormConsulta extends StatelessWidget {
  
  const CarnetFormConsulta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final globalProvider = Provider.of<GlobalProvider>(context);
    
    
    return Column(

      children: [

        AutoSizeText('INGRESE EL CARNET DE EXTRANJERIA', style: textstylewelcome(context), maxLines: 1, minFontSize: 6,),            
        
        NumpadV2(
          
          length: 9,

          onPressed: (String value) async{

            if( value == '' || value.length<9 ){
              
              showSnackBarAwesome(context, 'Error', 'Ingrese un Pasaporte valido', ContentType.failure);

            }else{

              validarConsulta(context, value, globalProvider.codServicio);

            }

          },

        )
      
      ],

    );

    
  }
}