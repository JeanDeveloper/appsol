import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solgis/people/presentation/widgets/widgets.dart';
import 'package:solgis/theme/theme_people.dart';

class HomePagePeople extends StatelessWidget {
  
  const HomePagePeople({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      
      body: SizedBox.expand(
        
        child: Stack(

          children:  [
    
            const HomePageBackGroundPeople(),

            const _HomeHeaderPeople(),

            const InformacionClientePeopleWidget(),

            Positioned(
              bottom: 0,

              //aqui debe tener el container que se expande con sus hijos.
              child: FondoMenuPeople(

                padding: EdgeInsets.symmetric(vertical:size.height*0.035),
                child: const _IconMenuPeople(),

              )

            ),

          ],

        ),

      ),

    );

  }

}

class _HomeHeaderPeople extends StatelessWidget {

  const _HomeHeaderPeople({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height: 200,

      child: SafeArea(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Text('PEOPLE', style: AppThemePeople.lighThemePeople.textTheme.headline1 ),
      
            SizedBox(height: size.height*0.05),
      
            Align(
              alignment: Alignment.centerLeft,
              child: Text('BIENVENIDO A: ', style: AppThemePeople.lighThemePeople.textTheme.headline3?.copyWith(color: Colors.amber)),
            ),
      
            SizedBox(height: size.height*0.02),

          ],
      
        ),

      ),

    );

  }

}

class _IconMenuPeople extends StatelessWidget {
  
  const _IconMenuPeople({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Row(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        //REGISTRAR
        ButtonMenuPeople(
          icon: FontAwesomeIcons.person, 
          text: 'REGISTRAR',
          onpressed: ()=> Navigator.pushNamed(context, 'registrar_movimiento_people'),
        ),

        SizedBox(width: size.width*0.08),

        //MOVIMIENTOS
        ButtonMenuPeople(
          icon: FontAwesomeIcons.peopleGroup, 
          text: 'MOVIMIENTOS',
          onpressed: ()=>Navigator.pushNamed(context, 'movimientos_page_people'),
        ),

        SizedBox(width:  size.width*0.08),

        //CONSULTAR
        ButtonMenuPeople(
          icon: FontAwesomeIcons.magnifyingGlass, 
          text: 'CONSULTAR',
          onpressed: ()=>Navigator.pushNamed(context, 'consulta_home_page_people'),
        ),

        SizedBox(width:  size.width*0.08),

        //SALIR
        ButtonMenuPeople(
          icon: FontAwesomeIcons.arrowRightFromBracket, 
          text: 'SALIR',
          // onpressed: ()=>SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
          onpressed: ()=>Navigator.pushReplacementNamed(context, 'home'),
        ),

      ],

    );

  }

}