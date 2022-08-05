import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/home/domain/providers/global_provider.dart';
import 'package:solgis/people/domain/helpers/show_snackbar_awesome.dart';
import 'package:solgis/people/domain/helpers/validar_consulta.dart';
import 'package:solgis/people/presentation/widgets/numpad2_people.dart';
import 'package:solgis/theme/theme_people.dart';

class DNIFormConsulta extends StatelessWidget {
  
  const DNIFormConsulta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final loginGlobal = Provider.of<GlobalProvider>(context);
    
    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [

        AutoSizeText('INGRESE EL NUMERO DE DNI', style: AppThemePeople.lighThemePeople.textTheme.headline2,), 

        NumpadV2(
          
          length: 8,

          onPressed: (String value) async{

            if( value == '' || value.length<8 ){
              
              showSnackBarAwesome(context, 'Error', 'Ingrese un dni valido', ContentType.failure);

            }else{

              validarConsulta(context, value, loginGlobal.codServicio);

            }

          },

        )
      
      ],

    );
  
  }

}