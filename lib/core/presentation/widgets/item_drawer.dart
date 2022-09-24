import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemWidget extends StatelessWidget {

  final String text;
  final FaIcon icon;
  final Color color;

  const ItemWidget({
    super.key, 
    required this.text, 
    required this.icon, 
    required this.color
  });


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Padding(

      padding: const EdgeInsets.only(left: 15),

      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          icon,
          SizedBox(width: size.width*0.01),
          AutoSizeText(text, style: TextStyle(color: color), maxLines: 1,)

        ]

      ),

    );

  }
}