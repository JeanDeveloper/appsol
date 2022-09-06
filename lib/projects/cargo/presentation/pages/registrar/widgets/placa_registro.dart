import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:solgis/projects/cargo/theme/theme_cargo.dart';

class PlacaFormRegistro extends StatelessWidget {

  const PlacaFormRegistro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    // final loginProvider = Provider.of<GlobalProvider>(context);
    final size = MediaQuery.of(context).size;



    return Container(

      width: size.width*0.8,
      // height: size.height*0.6,
      color: Colors.red,


      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [

          AutoSizeText('INGRESE EL NUMERO DE PLACA', style: AppThemeCargo.lighThemeCargo.textTheme.headline3,), 
          SizedBox(height: size.height*0.05),

          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: InputWidget
          ),




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
      ),
    );

  }

}