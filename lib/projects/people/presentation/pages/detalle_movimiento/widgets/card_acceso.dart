import 'package:flutter/material.dart';

class CardAcceso extends StatelessWidget {

  final String tipoDatoAcceso;
  final String? pathUrl;
  final String? textDato;

  const CardAcceso({
    Key? key, 
    required this.tipoDatoAcceso, 
    required this.pathUrl, 
    required this.textDato
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.35,
      height: (pathUrl != '') ? size.height*0.35 : size.height*0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(1, 1),
          ),
        ],
      ),

      child: Column(

        children: [

          Expanded(
            flex: 1,
            child: Container(
              width: size.width*0.4,
              height: size.height*0.04,
              decoration: const BoxDecoration(
                color: Color(0xff213A89),
                borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12))
              ),
              child: Center(child: Text(tipoDatoAcceso, style: const TextStyle(color: Colors.white))),
            ),
          ),

          //FOTO
          if(pathUrl != '')
            Expanded(flex:7 ,child: Image(image: NetworkImage(pathUrl!),fit: BoxFit.cover)),

          Expanded(
            flex:2 , 
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 5),
                child: Text(textDato!,textAlign: TextAlign.center),
              ),
            )
          ),

        ],

      ),

    );
  }
}