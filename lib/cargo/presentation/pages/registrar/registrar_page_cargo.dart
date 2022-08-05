import 'package:flutter/material.dart';
import 'package:solgis/cargo/presentation/pages/home/widgets/widgets.dart';
import 'package:solgis/cargo/presentation/pages/registrar/widgets/widgets.dart';
import 'package:solgis/cargo/presentation/widgets/widgets.dart';

class RegistrarPageCargo extends StatelessWidget {
  
  const RegistrarPageCargo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final viewBotton  = MediaQuery.of(context).viewInsets.bottom;
    // final registerProvider = Provider.of<RegistrarFormProvider>(context);

    return Scaffold(

      body: Stack(

        children:  [

          //FONDO
          const HomePageBackGroundCargo(),

          //FORMULARIO DE REGISTRO
          const RegistrarFormCargo(),

          //MENU BOTTOM
          Visibility(
            visible: (viewBotton==0) ? true: false,
            child: Positioned(
            
              bottom: 0,
          
              child: BottomMenuCargo(
          
              padding: EdgeInsets.symmetric(vertical: size.height*0.035 ),
                
                child: const MenuOptions(),
            
              ),
          
            ),
          ),

        ],

      ),
    
    );

  }
  
}