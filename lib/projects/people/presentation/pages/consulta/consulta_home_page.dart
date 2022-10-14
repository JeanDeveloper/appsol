import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/people/domain/providers/radio_list_consulta_provider.dart';
import 'package:solgis/projects/people/presentation/pages/consulta/widgets/widgets.dart';
import 'package:solgis/projects/people/presentation/widgets/widgets.dart';

class ConsultaHomePage extends StatelessWidget {

  const ConsultaHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    final viewBotton  = MediaQuery.of(context).viewInsets.bottom;

    return MultiProvider(

      providers: [ChangeNotifierProvider(create:  ((context) =>  RadioListConsultaProvider()))],
      
      child: Scaffold(
        
        body: SizedBox(
    
          width: size.width,
          height: size.height,
          
          child: Stack(
    
            children:  [

              //FONDO
              const HomePageBackGroundPeople(),
              //FORMULARIO DE REGISTRO
              const FormConsulta(),
              
              //MENU BOTTOM
              Visibility(

                visible: (viewBotton==0) ? true: false,

                child: Positioned(
                
                  bottom: 0,
                  
                  child: FondoMenuPeople(
                  
                  padding: EdgeInsets.symmetric(vertical: size.height*0.030 ),
                    
                    child: ButtonMenuPeople(
                  
                      icon: FontAwesomeIcons.house,
                      text: 'Inicio', 
                  
                      onpressed:()=> Navigator.pushNamed(context, '/'),
                  
                    ),
                
                  ),
                  
                ),

              ),
            ],
          ),
        ),

      ),

    );

  }
  
}