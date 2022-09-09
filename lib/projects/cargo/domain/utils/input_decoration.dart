import 'package:flutter/material.dart';

class InputDecorationClass{

  static  InputDecoration formInputDecoration() => InputDecoration(
    
  isDense: true,

  counterText: '',

  contentPadding: const EdgeInsets.all(15),

  enabledBorder: OutlineInputBorder(


    borderSide: const BorderSide(
      color: Colors.white,
      width: 2,
    ),

    borderRadius: BorderRadius.circular(10),

  ),

  focusedBorder: OutlineInputBorder(

    borderSide: const BorderSide(

      color: Color(0xff06087F),
      width: 2,

    ),
    
    borderRadius: BorderRadius.circular(10),
  ),

  errorBorder: OutlineInputBorder(

    borderSide: const BorderSide(
      color: Colors.red,
      width: 2,
    ),

    borderRadius: BorderRadius.circular(10),

  ),

  );

}