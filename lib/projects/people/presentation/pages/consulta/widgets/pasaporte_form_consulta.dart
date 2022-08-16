import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/people/domain/helpers/validar_consulta.dart';
import 'package:solgis/projects/people/domain/providers/consulta_form_provider.dart';
import 'package:solgis/projects/people/presentation/widgets/widgets.dart';

class PasaporteFormConsulta extends StatelessWidget {
  
  const PasaporteFormConsulta({Key? key}) : super(key: key);

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

              length: 12,

              validator: (value){
                return (value!.length<9)
                  ? 'ingrese un pasaporte correcto'
                  : null;
              },

              onchanged: (value)=> consultaForm.pasaporte = value,

              hintext: 'Ingrese el pasaporte', 
              icon: FontAwesomeIcons.idCard, 

            ),

          ),

          const SizedBox(height:20),

          TextButton(

            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),

            child: Text('BUSCAR', style: TextStyle(fontSize: size.width*0.05, color: Colors.black),),
            
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