import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solgis/core/theme/theme.dart';



class RefusedPage extends StatelessWidget {
  
  const RefusedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return Scaffold(

      backgroundColor: AppThemeGeneral.lighTheme.backgroundColor,
      
      body: SafeArea(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(           
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SvgPicture.asset(
                'assets/svgs/refused-page.svg',
                width: size.width*0.9,
                height: size.height*0.7,
              ),
            ),

            const Text('Su peticion a sido Rechazada'),
            const SizedBox(height: 20),
            const Text('Contacte a soporte de SOLMAR'),
            const SizedBox(height: 20),

            RichText(
              text: const TextSpan(
                text: 'Estado del Dispositivo: ',
                style: TextStyle(color: Colors.black,),
                children: [
                  TextSpan(text:'RECHAZADO', style: TextStyle(color: Colors.red)),
                ]
              ),
            ),

          ],

        ),
      ),

    );

  }

}