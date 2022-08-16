import 'package:flutter/material.dart';

class InputDecorationsPeople {


  static InputDecoration formInputDecorationPeople({
    required String labelText,
  })
    {
    return  InputDecoration(

      
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Colors.white,
        fontSize: 30,
      ),
      
      floatingLabelAlignment: FloatingLabelAlignment.center,
      contentPadding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),

      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.white
        )
      ),

      focusedBorder:const  OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.white
        )
      ),
      
      
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.red
        )
      ),

    );
  }
  

}