import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solgis/home/domain/models/app_model.dart';
import 'package:solgis/people/domain/helpers/show_snackbar_awesome.dart';

class CardApp extends StatelessWidget {
  final AppModel app;

  const CardApp({
    Key? key, 

    required this.app
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: (){

        if(app.nombre=='Cargo'){
          return showSnackBarAwesome(context, 'Hola', 'Estamos trabajando para brindarte mas apps', ContentType.success);
        }

        Navigator.pushNamed(context, app.url!);

      },
      child: Container(
    
        decoration: getDecoration(),
    
    
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset( app.imageUrl!,height:size.height*0.18 ),
            
            Positioned(
              
              bottom: 0,
              child: Container(
                alignment: Alignment.center,
                width: size.width*0.43,
                height: size.height*0.05,
                decoration:  const BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                ),
                child: Text(app.nombre!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:size.width*0.06 )),
    
              ),
    
            ),
    
          ],
        
        ),
    
      
      ),
    );

  }

}

BoxDecoration getDecoration(){
  return BoxDecoration(
    borderRadius:BorderRadius.circular(20), 
    color: Colors.white,
    boxShadow: const [
      BoxShadow(
        color: Colors.black,
        blurRadius: 7,
        offset: Offset(0, 0)
      )
    ]
  );
}