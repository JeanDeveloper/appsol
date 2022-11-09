import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:solgis/core/theme/theme.dart';

class PendingPage extends StatelessWidget {

  const PendingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppThemeGeneral.lighTheme.backgroundColor,

      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SvgPicture.asset(
              'assets/svgs/pending-page.svg',
            ),
          ),

          const Text('Su peticion a sido enviada'),
          const SizedBox(height: 20),
          const Text('Estamos en espera de la aprobacion'),
          const SizedBox(height: 20),

          RichText(
            text: const TextSpan(
              text: 'Estado del Dispositivo: ',
              style: TextStyle(color: Colors.black,),
              children: [
                TextSpan(text:'PENDIENTE', style: TextStyle(color: Colors.green)),
              ]
            ),
          ),

        ],
      ),
    );
  }
}