import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/cargo/domain/helpers/consultar_placa.dart';
import 'package:solgis/projects/cargo/domain/providers/registrar_form_cargo_provider.dart';
import 'package:solgis/projects/cargo/domain/providers/registrar_form_cargo.dart';
import 'package:solgis/projects/cargo/domain/utils/input_decoration.dart';
import 'package:solgis/projects/cargo/theme/theme_cargo.dart';

class PlacaFormRegistro extends StatelessWidget {

  const PlacaFormRegistro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final registroProvider = Provider.of<RegisterProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;

    return SizedBox(

      width: size.width*0.95,
      height: size.height*0.6,

      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,

        children: [

          AutoSizeText('INGRESE EL NUMERO DE PLACA', style: AppThemeCargo.lighThemeCargo.textTheme.headline3,), 
          SizedBox(height: size.height*0.05),

          Form(

            key: registroProvider.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,

            child: InputWidgetCargo(
              length: 6,
              onchanged: (value){
                registroProvider.placa=value;
                if(value.length == 6) consultarPlaca(context, registroProvider.placa);
              },

              hintext: 'Ingrese la placa', 
              icon: FontAwesomeIcons.idCardClip, 

              


              // validator: (value){
              //   return ( value!.length<6 )
              //   ? 'ingrese una placa valida'
              //   : null;
              // },

            )

          ),

          // Form(

          //   child: Row(

          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,

          //     children: [

          //       InputTextCuadrado(
          //         onchanged: (value) {
          //           if(value.length==1){
          //             registroProvider.placa += value;
          //             FocusScope.of(context).nextFocus();
          //           }
          //           if(value.isEmpty){
          //             registroProvider.placa = '';
          //             FocusScope.of(context).previousFocus();
          //           }
          //         },
          //       ),

          //       InputTextCuadrado(
          //         onchanged: (value) {
          //           if(value.length==1){
          //             registroProvider.placa += value;
          //             FocusScope.of(context).nextFocus();
          //           }
          //           if(value.isEmpty){
          //             registroProvider.placa = registroProvider.placa.substring(0, registroProvider.placa.length-1);
          //             FocusScope.of(context).previousFocus();
          //           }
          //         },
          //       ),

          //       InputTextCuadrado(
          //         onchanged: (value) {
          //           if(value.length==1){
          //             registroProvider.placa += value;
          //             FocusScope.of(context).nextFocus();
          //           }
          //           if(value.isEmpty){
          //             registroProvider.placa = registroProvider.placa.substring(0, registroProvider.placa.length-1);
          //             FocusScope.of(context).previousFocus();
          //           }
          //         },
          //       ),

          //       InputTextCuadrado(
          //         onchanged: (value) {
          //           if(value.length==1){
          //             registroProvider.placa += value;
          //             FocusScope.of(context).nextFocus();
          //           }
          //           if(value.isEmpty){
          //             registroProvider.placa = registroProvider.placa.substring(0, registroProvider.placa.length-1);
          //             FocusScope.of(context).previousFocus();
          //           }
          //         },
          //       ),

          //       InputTextCuadrado(
          //         onchanged: (value) {
          //           if(value.length==1){
          //             registroProvider.placa += value;
          //             FocusScope.of(context).nextFocus();
          //           }
          //           if(value.isEmpty){
          //             registroProvider.placa = registroProvider.placa.substring(0, registroProvider.placa.length-1);
          //             FocusScope.of(context).previousFocus();
          //           }
          //         },
          //       ),

          //       InputTextCuadrado(
          //         onchanged: (value) {

          //           if(value.length==1){
          //             registroProvider.placa += value;
          //             FocusScope.of(context).nextFocus();
          //             consultarPlaca(context, registroProvider.placa);
          //           }

          //           if(value.isEmpty){
          //             registroProvider.placa = registroProvider.placa.substring(0, registroProvider.placa.length-1);
          //             FocusScope.of(context).previousFocus();
          //           }

          //         },
          //       ),

          //     ],
          //   ),
          // ),


        ],
      ),
    );  
  }

}


class InputTextCuadrado extends StatelessWidget {

  final Function(String)? onchanged;

  const InputTextCuadrado({
    Key? key, 
    this.onchanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.2,
      width: size.width*0.13,

      child: TextFormField(

        onChanged: onchanged,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize:20),
        decoration: InputDecorationClass.formInputDecoration(),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          // FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );

    
  }
}