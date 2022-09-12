import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/cargo/domain/helpers/consultar_placa.dart';
import 'package:solgis/projects/cargo/domain/providers/registrar_form_cargo.dart';
import 'package:solgis/projects/cargo/domain/utils/input_decoration.dart';
import 'package:solgis/projects/cargo/theme/theme_cargo.dart';

class PlacaFormRegistro extends StatelessWidget {

  const PlacaFormRegistro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final registroProvider = Provider.of<RadioListProvider>(context);
    final size = MediaQuery.of(context).size;

    return SizedBox(

      width: size.width*0.95,
      height: size.height*0.6,

      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          AutoSizeText('INGRESE EL NUMERO DE PLACA', style: AppThemeCargo.lighThemeCargo.textTheme.headline3,), 
          SizedBox(height: size.height*0.05),

          Form(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                SizedBox(
                  height: size.height * 0.2,
                  width: size.width*0.13,

                  child: TextFormField(
                    // textInputAction: TextInputAction.continueAction,
                    
                    onChanged: (value) {
                      if(value.length==1){
                        registroProvider.placa += value;
                        FocusScope.of(context).nextFocus();
                      }
                      if(value.isEmpty){
                        registroProvider.placa = '';
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize:20),
                    decoration: InputDecorationClass.formInputDecoration(),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      // FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),

                SizedBox(
                  height: size.height * 0.2,
                  width: size.width*0.13,
                  child: TextFormField(
                    
                    onChanged: (value) {
                      if(value.length==1){
                        registroProvider.placa += value;
                        FocusScope.of(context).nextFocus();
                      }
                      if(value.isEmpty){
                        registroProvider.placa = registroProvider.placa.substring(0, registroProvider.placa.length-1);
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize:20),
                    decoration: InputDecorationClass.formInputDecoration(),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                  ),
                ),

                SizedBox(
                  height: size.height * 0.2,
                  width: size.width*0.13,
                  child: TextFormField(
                    
                    onChanged: (value) {
                      if(value.length==1){
                        registroProvider.placa += value;
                        FocusScope.of(context).nextFocus();
                      }
                      if(value.isEmpty){
                        registroProvider.placa = registroProvider.placa.substring(0, registroProvider.placa.length-1);
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize:20),
                    decoration: InputDecorationClass.formInputDecoration(),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                  ),
                ),

                SizedBox(
                  height: size.height * 0.2,
                  width: size.width*0.13,
                  child: TextFormField(
                    
                    onChanged: (value) {
                      if(value.length==1){
                        registroProvider.placa += value;
                        FocusScope.of(context).nextFocus();
                      }
                      if(value.isEmpty){
                        registroProvider.placa = registroProvider.placa.substring(0, registroProvider.placa.length-1);
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize:20),
                    decoration: InputDecorationClass.formInputDecoration(),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                  ),
                ),

                SizedBox(
                  height: size.height * 0.2,
                  width: size.width*0.13,
                  child: TextFormField(
                    
                    onChanged: (value) {
                      if(value.length==1){
                        registroProvider.placa += value;
                        FocusScope.of(context).nextFocus();
                      }
                      if(value.isEmpty){
                        registroProvider.placa = registroProvider.placa.substring(0, registroProvider.placa.length-1);
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize:20),
                    decoration: InputDecorationClass.formInputDecoration(),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                  ),
                ),

                SizedBox(
                  height: size.height * 0.2,
                  width: size.width*0.13,
                  child: TextFormField(
                    
                    onChanged: (value) {

                      if(value.length==1){
                        registroProvider.placa += value;
                        FocusScope.of(context).nextFocus();
                        print('Evaluando la Placa n°: ${registroProvider.placa}');
                        consultarPlaca(context, registroProvider.placa);
                      }

                      if(value.isEmpty){
                        registroProvider.placa = registroProvider.placa.substring(0, registroProvider.placa.length-1);
                        FocusScope.of(context).previousFocus();
                      }

                    },

                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize:20),
                    decoration: InputDecorationClass.formInputDecoration(),
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                  ),

                ),

              ],
            ),
          ),
        ],
      ),
    );

  }

}