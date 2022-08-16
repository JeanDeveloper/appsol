import 'package:flutter/material.dart';
import 'package:solgis/projects/cargo/presentation/pages/home/widgets/widgets.dart';
import 'package:solgis/projects/cargo/presentation/widgets/widgets.dart';

class HomePageCargo extends StatelessWidget {
  
  const HomePageCargo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      
      body: SizedBox.expand(
        
        child: Stack(

          children:  [

            const HomePageBackGroundCargo(),

            const HomeHeaderCargo(),

            const InformacionClienteCargo(),

            Positioned(
              bottom: 0,

              //aqui debe tener el container que se expande con sus hijos.
              child: BottomMenuCargo(

                padding: EdgeInsets.symmetric(vertical:size.height*0.035),
                child: const MenuCargo(),

              )

            ),

          ],

        ),

      ),

    );

  }

}