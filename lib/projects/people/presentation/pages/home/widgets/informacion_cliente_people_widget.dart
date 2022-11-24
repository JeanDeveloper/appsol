import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/people/theme/theme.dart';

class InformacionClientePeopleWidget extends StatelessWidget {
  
  const InformacionClientePeopleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final loginGlobal = Provider.of<GlobalProvider>(context);


    return SizedBox(

      width: double.infinity,
      height: size.height*0.9,

      child: SafeArea(

        child: Column(

          children: [
            
            SizedBox(height: size.height*0.15),

            FadeInImage(
              width: size.width*0.48,
              height: size.width*0.48,
              placeholder:  const AssetImage('assets/gifs/loading.gif'), 
              image: AssetImage("assets/pngs/${loginGlobal.nombreCliente}.png")
            ),

            SizedBox(height: size.height*0.015),
            
            Text(
              (loginGlobal.codTipoServicio==1000)? 'Planta' : 'Flota',
              style: AppThemePeople.lighThemePeople.textTheme.headline1
            ),// NOMBRE DEL TIPO DE SERVICIO - dinamico

            SizedBox(height: size.height*0.015),

            Text(
                loginGlobal.nombreSubArea.split(' ')
                  .map((word) {
                    if (word == '') return '';
                    return word[0] + word.substring(1).toLowerCase();
                  })
                  .join(' '),
              style: AppThemePeople.lighThemePeople.textTheme.headline3?.copyWith(  
                color: Colors.amber
              )
            ),//NOMBRE DEL SERVICIO - dinamico

            Text(
              loginGlobal.codServicio,
              style: AppThemePeople.lighThemePeople.textTheme.headline1 
            ),//CODIGO DEL SERVICIO - dinamico

          ],

        ),

      ),
      
    );
    
  }

}