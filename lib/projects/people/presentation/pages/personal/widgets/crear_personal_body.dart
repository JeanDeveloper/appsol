import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/people/domain/helpers/guardar_personal.dart';
import 'package:solgis/projects/people/domain/providers/crear_personal_provider.dart';
import 'package:solgis/projects/people/domain/utils/button_style_step.dart';
import 'package:solgis/projects/people/presentation/pages/personal/widgets/second_form.dart';
import 'package:solgis/projects/people/presentation/pages/personal/widgets/widgets.dart';

class CrearPersonalBody extends StatelessWidget {

  const CrearPersonalBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    final personalProvider = Provider.of<CrearPersonalProvider>(context);

    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(

        
        
      ),
    );

    // return Stepper(
    
    //   currentStep: personalProvider.getValorStep,

    //   type: StepperType.horizontal,
      
    //   controlsBuilder: (BuildContext context, ControlsDetails details){
    
    //     return Row(

    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    
    //       children: <Widget>[
    
    //         Expanded(
    
    //           child: TextButton(
    //             style: getStyleButtonStep(context),
    //             onPressed: details.onStepContinue,

    //             child: Padding(
    //               padding: const  EdgeInsets.all(8.0),
    //               child: AutoSizeText( ( personalProvider.getValorStep == 1 ) ? 'Guardar': 'Continuar', style:  TextStyle( color: Colors.white, fontSize: size.width*0.04)),
    //             ),

    //           ),

    //         ),

    //         SizedBox(width: (personalProvider.getValorStep != 0) ? size.width*0.1: null),

    //         if(personalProvider.getValorStep != 0 )
    //           Expanded(
    //             child: TextButton(
    //               style: getStyleButtonStep(context),
    //               onPressed: details.onStepCancel,
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: AutoSizeText('Regresar ', style: TextStyle(color: Colors.white, fontSize: size.width*0.04)),
    //               ),
    //             ),
    //           ),

    //       ],

    //     );

    //   } ,

    //   onStepContinue: (){

    //     if(personalProvider.getValorStep<=0){
    //       if(personalProvider.isValidForm(personalProvider.getValorStep)){
    //         personalProvider.setValorStep = personalProvider.getValorStep + 1;
    //         FocusScope.of(context).requestFocus(FocusNode());
    //       }
    //     }else{
    //       print(personalProvider.getValorStep);
    //       print(personalProvider.isValidForm(0));
    //       print(personalProvider.isValidForm(1));

    //       if(personalProvider.isValidForm(personalProvider.getValorStep)) guardarPersonal(context);
    //     }
    //   },

    //   onStepCancel: (){
    //     if(personalProvider.getValorStep>0) personalProvider.setValorStep =  personalProvider.getValorStep - 1;
    //   },

    //   steps: getSteps(context),

    // );


  }

  List<Step> getSteps(BuildContext context ){

    final personalProvider = Provider.of<CrearPersonalProvider>(context, listen: false);

    return [

      Step(
        
        state: personalProvider.getValorStep>0 ? StepState.complete : StepState.indexed ,
        isActive: personalProvider.getValorStep>=0,
        title: const Text('Empezar',style: TextStyle(color: Colors.black)), 
        content: const FirstForm(),
      ),

      Step(
        isActive: personalProvider.getValorStep>=1,
        title: const Text('Terminar',style: TextStyle(color: Colors.black)), 
        content: const SecondForm(),
      ),
      
      
    ];

// 937085454
  }


}