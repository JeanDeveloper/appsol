import 'package:flutter/material.dart';

class InputDecorationsReadOnly{

  static InputDecoration formInputDecorationReadOnly(){

    return const InputDecoration(
      contentPadding: EdgeInsets.only(bottom: 18 ),

      border: InputBorder.none,
      enabledBorder:   InputBorder.none,


    );

  }

}