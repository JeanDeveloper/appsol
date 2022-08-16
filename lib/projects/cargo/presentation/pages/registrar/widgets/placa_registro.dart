import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/cargo/theme/theme_cargo.dart';

class PlacaFormRegistro extends StatelessWidget {

  const PlacaFormRegistro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final loginProvider = Provider.of<GlobalProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [

        AutoSizeText('INGRESE EL NUMERO DE PLACA', style: AppThemeCargo.lighThemeCargo.textTheme.headline2,), 

        // NumPad(
          
        //   length: 8,

        //   onPressed: (String value) async{

        //     if( value == '' || value.length<8 ){
              
        //       showSnackBarAwesome(context, 'Error', 'Ingrese un dni valido', ContentType.failure);

        //     }else{

        //       consultarDOI(context, value, loginProvider.codServicio);

        //     }

        //   },

        // )
      
      ],

    );

  }

}