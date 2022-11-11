import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(

      body: Center(

        child:Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const CircularProgressIndicator(),
            SizedBox(height: size.height*0.02,),
            const Text('Cargando...')

          ],

        )

      ),

    );

  }

}