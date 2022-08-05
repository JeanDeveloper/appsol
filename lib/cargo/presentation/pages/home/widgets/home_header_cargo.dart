import 'package:flutter/material.dart';
import 'package:solgis/theme/theme_cargo.dart';

class HomeHeaderCargo extends StatelessWidget {

  const HomeHeaderCargo({
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

            Text('CARGO', style: AppThemeCargo.lighThemeCargo.textTheme.headline1 ),
      
            SizedBox(height: size.height*0.05),
      
            Align(
              alignment: Alignment.centerLeft,
              child: Text('BIENVENIDO A: ', style: AppThemeCargo.lighThemeCargo.textTheme.headline3?.copyWith(color: Colors.amber)),
            ),
      
            SizedBox(height: size.height*0.02),

          ],
      
        ),

      ),

    );

  }

}