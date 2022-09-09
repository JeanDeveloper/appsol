import 'package:flutter/material.dart';

class PreviewWidget extends StatelessWidget {
  
  final String text;

  const PreviewWidget({
    Key? key, 
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> previewLength = [];

    for( var i = 0; i < 6; i++){

      bool valor = text.length >= i+1;
      previewLength.add(Dot(isActive: valor, number: valor? text.substring(i,i+1): null ));

    }

    return Container(

      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Wrap(
        children: previewLength,
      ),

    );

  }

}


class Dot extends StatelessWidget {

  final bool isActive;
  final String? number;

  const Dot({
    Key? key, 
    required this.isActive, 
    this.number
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: isActive
        ? SizedBox(width: 20, height: 20, child: Text('$number', style: const TextStyle(color: Colors.white, fontSize:20, fontWeight: FontWeight.bold)))
        : Container(
          width: 20,
          height: 20,

          decoration:  BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: Colors.white
            ),
            borderRadius: BorderRadius.circular(30)
          ),

        )
    );




  }
}