import 'package:flutter/material.dart';

InputDecoration inputDecorationDatos()=> const  InputDecoration(

  contentPadding: EdgeInsets.only(left: 10),


  enabledBorder:  OutlineInputBorder(
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

InputDecoration inputDecorationDropDown()=> const InputDecoration(

  contentPadding: EdgeInsets.only(bottom: 10),

);


InputDecoration inputDecorationDropDownPersonal()=> const InputDecoration(

  contentPadding: EdgeInsets.only(left:10,bottom: 10),


  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(
      color: Colors.red
    )
  ),

  enabledBorder:  OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(
      color: Colors.black
    )
  ),

  focusedBorder:  OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(
      color: Colors.blue
    )
  ),

  errorBorder:  OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(
      color: Colors.red
    )
  ),


);