import 'package:flutter/material.dart';

InputDecoration inputDecoration()=> const InputDecoration(

  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),

  filled: true,

  fillColor: Color(0xffF6F2EC),

  counterText: '',

  enabledBorder: OutlineInputBorder(

    borderRadius: BorderRadius.all(Radius.circular(20)),

    borderSide: BorderSide(
      color: Colors.black,
      width: 1,
    )
  
  ),

  focusedBorder: OutlineInputBorder(

    borderRadius: BorderRadius.all(Radius.circular(20)),

    borderSide: BorderSide(
      color: Colors.blue,
      width: 1,
    )
  
  ),


  disabledBorder: OutlineInputBorder(

    borderRadius: BorderRadius.all(Radius.circular(20)),

    borderSide: BorderSide(
      color: Colors.black,
      width: 1,
    )
  
  ),

  errorBorder: OutlineInputBorder(

    borderRadius: BorderRadius.all(Radius.circular(20)),

    borderSide: BorderSide(
      color: Colors.red,
      width: 1,
    )
  
  ),
  
  focusedErrorBorder: OutlineInputBorder(

    borderRadius: BorderRadius.all(Radius.circular(20)),

    borderSide: BorderSide(
      color: Colors.red,
      width: 1,
    )

  ),

);

