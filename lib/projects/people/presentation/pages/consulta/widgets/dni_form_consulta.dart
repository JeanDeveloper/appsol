import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:solgis/projects/people/presentation/widgets/numpad2_people.dart';
import 'package:solgis/projects/people/theme/theme.dart';

class DNIFormConsulta extends StatelessWidget {
  
  const DNIFormConsulta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    
    return Column(

      crossAxisAlignment: CrossAxisAlignment.center,

      children: [

        AutoSizeText('Ingrese el DNI', style: AppThemePeople.lighThemePeople.textTheme.headline2,), 
        NumpadV2(
          length: 8,

          // onPressed: (String value) async{
          //   if( value == '' || value.length<8 ) showSnackBarAwesome(context, 'Error', 'Ingrese un dni valido', ContentType.failure);
          //   validarConsulta(context, value, loginGlobal.codServicio);
          // },
        )

      ],

    );

  }

}