import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:solgis/home/domain/providers/global_provider.dart';
import 'package:solgis/people/domain/helpers/consultar_doi_people.dart';
import 'package:solgis/people/domain/helpers/show_snackbar_awesome.dart';
import 'package:solgis/people/domain/providers/providers.dart';
import 'package:solgis/people/presentation/widgets/widgets.dart';
import 'package:solgis/theme/theme_people.dart';


class RegistrarForm extends StatelessWidget {
  
  const RegistrarForm({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final tipoProvider = Provider.of<RadioProvider>(context);

    return Container(

      margin: const EdgeInsets.all(15),
      width: size.width,
      height: size.height,
      alignment: Alignment.center,

      child: SingleChildScrollView(

        child: Column(
        
          children: [

            _TipoCarnet(),

            SizedBox(height: size.height*0.05),

            if(tipoProvider.valorTipoDocumento==1)
              const _DNIFormRegister(),
            
            if(tipoProvider.valorTipoDocumento==2)
              const _CarnetFormRegister(),
            
            if(tipoProvider.valorTipoDocumento==3)
              const _PasaporteFormRegister(),

          ],

        ),

      ),

    );

  }

}

class _TipoCarnet extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tipoProvider = Provider.of<RadioProvider>(context);

    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          // radio de dni, por defecto esta encendido
          SizedBox(
            width: size.width*0.25,
            child: RadioListTile<int>(
              activeColor: Colors.white,
              contentPadding: const EdgeInsets.all(0),
              value:1, 
              groupValue: tipoProvider.valorTipoDocumento, 
              onChanged: (value){
                tipoProvider.valorTipoDocumento=value! ;
              },
              title: AutoSizeText('DNI', style:AppThemePeople.lighThemePeople.textTheme.headline3),
            ),
          ),

          // radio de extranjeria
          SizedBox(
            width: size.width*0.25,
            child: RadioListTile<int>(
              activeColor: Colors.white,
              contentPadding: const EdgeInsets.all(0),
              value: 2, 
              groupValue: tipoProvider.valorTipoDocumento, 
              onChanged: (value){
                tipoProvider.valorTipoDocumento=value! ;
              },
              title: AutoSizeText('CE', style: AppThemePeople.lighThemePeople.textTheme.headline3),
            ),
          ),

          // radio de pasaporte
          SizedBox(
            width: size.width*0.35,
            child: RadioListTile<int>(
              value: 3, 
              groupValue: tipoProvider.valorTipoDocumento, 
              activeColor: Colors.white,
              contentPadding: const EdgeInsets.all(0),
              title: AutoSizeText('PASAPORTE', style: AppThemePeople.lighThemePeople.textTheme.headline3),
              onChanged: (value){
                tipoProvider.valorTipoDocumento=value!;
              },
            ),
          ),

        ],

      ),

    );

  }

}

class _DNIFormRegister extends StatelessWidget {

  const _DNIFormRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final loginProvider = Provider.of<GlobalProvider>(context);

    return Column(

      crossAxisAlignment: CrossAxisAlignment.center,

      children: [

        AutoSizeText('INGRESE EL NUMERO DE DNI', style: AppThemePeople.lighThemePeople.textTheme.headline2), 

        NumPad(
          
          length: 8,

          onPressed: (String value) async{

            if( value == '' || value.length<8 ){
              
              showSnackBarAwesome(context, 'Error', 'Ingrese un dni valido', ContentType.failure);

            }else{

              consultarDOI(context, value, loginProvider.codServicio);

            }

          },

        )
      
      ],

    );

  }

}

class _CarnetFormRegister extends StatelessWidget {
  
  const _CarnetFormRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final loginProvider = Provider.of<GlobalProvider>(context);
    
    return Column(

      children: [

        AutoSizeText('INGRESE EL CARNET DE EXTRANJERIA', style: AppThemePeople.lighThemePeople.textTheme.headline2, maxLines: 1, minFontSize: 6,),            
        
        NumPad(
          isDni: false,
          
          length: 9,

          onPressed: (String value) async{

            if( value == '' || value.length<9 ){
              
              showSnackBarAwesome(context, 'Error', 'Ingrese un Pasaporte valido', ContentType.failure);

            }else{

              consultarDOI(context, value, loginProvider.codServicio);

            }

          },

        )
      
      ],

    );

  }

}

class _PasaporteFormRegister extends StatelessWidget {
  
  const _PasaporteFormRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final registerForm = Provider.of<RegistrarFormProvider>(context);
    final loginProvider = Provider.of<GlobalProvider>(context);
    
    return SizedBox(

      width: size.width*0.8,
      height: size.height*0.67,

      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,

        children: [

          Form(
            
            key: registerForm.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,

            child: InputWidget(

              length: 12,

              initialvalue: registerForm.pasaporte,

              validator: (value){
                return ( value!.length<9)
                  ? 'ingrese un pasaporte valido'
                  :null;
              },

              onchanged: (value) =>registerForm.pasaporte=value,

              hintext: 'Ingrese el pasaporte', 
              icon: FontAwesomeIcons.idCard, 

            ),

          ),

          const SizedBox(height:20),

          ElevatedButton(

            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 100, vertical: 15)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
            
            child: const Text('BUSCAR', style: TextStyle(fontSize: 20, color: Colors.black),),
            
            onPressed: (){

              if(registerForm.isValidForm()){
              FocusScope.of(context).requestFocus(FocusNode());
              consultarDOI(context, registerForm.pasaporte, loginProvider.codServicio);
              }
              
            },

          )

        ],

      ),

    );

  }

}

