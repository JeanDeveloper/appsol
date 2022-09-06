import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solgis/projects/cargo/presentation/widgets/widgets.dart';

class MenuCargo extends StatelessWidget {

  const MenuCargo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Row(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        //REGISTRAR
        ButtonMenuCargo(
          icon: FontAwesomeIcons.car, 
          text: 'REGISTRAR',
          onpressed: ()=> Navigator.pushNamed(context, 'registrar_movimiento_cargo'),
          
          // onpressed:(){},
        ),

        SizedBox(width: size.width*0.1),

        //MOVIMIENTOS
        ButtonMenuCargo(
          icon: FontAwesomeIcons.carSide, 
          text: 'MOVIMIENTOS',
          // onpressed: ()=>Navigator.pushNamed(context, 'movimientos_page_people'),
          onpressed:(){},

        ),

        SizedBox(width:  size.width*0.1),

        //CONSULTAR
        ButtonMenuCargo(
          icon: FontAwesomeIcons.magnifyingGlass, 
          text: 'CONSULTAR',
          // onpressed: ()=>Navigator.pushNamed(context, 'consulta_home_page_people'),
          onpressed:(){},

        ),

        // SizedBox(width:  size.width*0.1),

        //SALIR
        // ButtonMenuCargo(
        //   icon: FontAwesomeIcons.arrowRightFromBracket, 
        //   text: 'SALIR',
        //   onpressed: ()=>Navigator.pushReplacementNamed(context, 'home'),
        //   // onpressed:(){},
        // ),

      ],

    );

  }

}