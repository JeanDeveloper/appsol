import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/people/presentation/widgets/numpad2_people.dart';
import 'package:solgis/projects/people/styles/style.dart';

class CarnetFormConsulta extends StatelessWidget {
  
  const CarnetFormConsulta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final globalProvider = Provider.of<GlobalProvider>(context);
    
    
    return Column(

      children: [

        AutoSizeText('Ingrese el Carnet de Extranjeria', style: textstylewelcome(context), maxLines: 1, minFontSize: 6,),            
        
        NumpadV2(
          
          length: 9,
          isDni: false,

          // onPressed: (String value) async{
          //   if( value == '' || value.length<9 ){
          //     showSnackBarAwesome(context, 'Error', 'Ingrese un Pasaporte valido', ContentType.failure);
          //   }else{
          //     validarConsulta(context, value, globalProvider.codServicio);
          //   }
          // },

        )
      
      ],

    );

    
  }
}