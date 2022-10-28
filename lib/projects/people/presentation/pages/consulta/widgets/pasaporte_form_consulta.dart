import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/people/domain/helpers/validar_consulta.dart';
import 'package:solgis/projects/people/domain/providers/consulta_form_provider.dart';
import 'package:solgis/projects/people/presentation/widgets/widgets.dart';

class PasaporteFormConsulta extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final consultaForm = Provider.of<ConsultaFormProvider>(context);
    final globalProvider = Provider.of<GlobalProvider>(context);


    return SizedBox(

      width: size.width*0.8,
      height: size.height*0.67,

      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,

        children: [

          Form(
            key: consultaForm.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            
            child: InputWidget(

              length: 11,

              validator: (value){
                return (value!.length<9 || value.length > 13)
                  ? ''
                  : null;
              },

              onchanged: (value){
                consultaForm.pasaporte = value;

                // if(consultaForm.pasaporte.length == 9) {
                //   FocusScope.of(context).requestFocus(FocusNode());
                //   validarConsulta(context, consultaForm.pasaporte , globalProvider.codServicio);
                //   consultaForm.pasaporte='';
                // }

              },


              // onchanged: (value)=> consultaForm.pasaporte = value,

              hintext: 'Ingrese el pasaporte', 
              icon: FontAwesomeIcons.idCard, 

            ),

          ),

          SizedBox(height:size.height* 0.05),

          TextButton(

            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 100, vertical: 15)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),

            child: const Text('Buscar', style: TextStyle(fontSize: 20, color: Colors.black),),
            
            onPressed: (){
              if(consultaForm.isValidForm()){
                validarConsulta(context, consultaForm.pasaporte , globalProvider.codServicio);
              }

            }, 
          )      

        ],

      ),

    );

  }


}