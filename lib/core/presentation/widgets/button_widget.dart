import 'package:flutter/material.dart';


class ButtonWidget extends StatelessWidget {
  

  final EdgeInsetsGeometry padding;

  final Function()? onpressed;

  final Widget child;
  

  const ButtonWidget({
    Key? key, 
    required this.padding, 
    this.onpressed, 
    required this.child
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    // final size = MediaQuery.of(context).size;

    return ElevatedButton(
      

      style: ButtonStyle(

        textStyle: MaterialStateProperty.all(
          Theme.of(context).textTheme.subtitle1!
        ),

        padding: MaterialStateProperty.all(padding),
      
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
        
        backgroundColor: MaterialStateProperty.all(const Color(0xff6F56FF))
      ),

      onPressed: onpressed,

      child:child,

    );

    
  }
}