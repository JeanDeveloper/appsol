import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/cargo/theme/theme_cargo.dart';

class InformacionClienteCargo extends StatelessWidget {
  
  const InformacionClienteCargo({Key? key}) : super(key: key);

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
              image: const AssetImage('assets/pngs/saasa.png')
            ),

            SizedBox(height: size.height*0.015),
            
            Text(
              (loginGlobal.codTipoServicio==1000)? 'PLANTA' : 'FLOTA',
              style: AppThemeCargo.lighThemeCargo.textTheme.headline1
            ),// NOMBRE DEL TIPO DE SERVICIO - dinamico

            SizedBox(height: size.height*0.015),
            
            Text(
              loginGlobal.nombreSubArea,
              style: AppThemeCargo.lighThemeCargo.textTheme.headline3?.copyWith(  
                color: Colors.amber
              )
            ),//NOMBRE DEL SERVICIO - dinamico
            
            Text(
              loginGlobal.codServicio,
              style: AppThemeCargo.lighThemeCargo.textTheme.headline1 
            ),//CODIGO DEL SERVICIO - dinamico
            
          ],

        ),

      ),
      
    );
    
  }

}