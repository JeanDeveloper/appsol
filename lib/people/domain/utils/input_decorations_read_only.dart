import 'package:flutter/material.dart';

class InputDecorationsReadOnly{

  static InputDecoration formInputDecorationReadOnly(){

    return const InputDecoration(
      contentPadding: EdgeInsets.only(left: 5 ),


      enabledBorder:   OutlineInputBorder(
        
        borderRadius: BorderRadius.all(Radius.circular(5)),

        borderSide: BorderSide(
          color: Colors.black
        )

      ),

      focusedBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(
          color: Colors.black
        )
      ),


    );

  }
  

}