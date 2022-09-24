import 'package:flutter/material.dart';

class InputWidgetCargo extends StatelessWidget {
  final int? length;
  final String hintext;
  final String? initialValue;
  final IconData icon;
  final void Function(String)? onchanged;
  final String? Function(String?)? validator;

  const InputWidgetCargo({
    this.length, 
    required this.hintext, 
    this.initialValue, 
    required this.icon, 
    this.onchanged, 
    this.validator
  });


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Padding(

      padding: EdgeInsets.symmetric(vertical:size.height*0.01, horizontal:size.width*0.2),

      child: TextFormField(

        maxLength: length,

        decoration: InputDecoration(

          counterText: '',
          contentPadding: EdgeInsets.symmetric(vertical: size.height*0.015),
          fillColor: Colors.white,
          filled: true,
          hintText: hintext,

          hintStyle: TextStyle(
            fontSize:  size.width*0.045,
            color: Colors.black 
          ),

          errorStyle: TextStyle(
            fontSize: size.width*0.045
          ),

          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.07),

            child: Icon(
              icon,
              size: size.width*0.068,
              color: Colors.black,
            ),
          ),

          border: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),

        ),

        style:  TextStyle(  
          color: Colors.black,
          // fontSize: getResponsiveText(size, size.width*0.045)
          fontSize: size.width*0.045
        ),

        textInputAction: TextInputAction.next,  
        keyboardType: TextInputType.name,
        validator: validator,
        onChanged: onchanged,

      ),

    );


  }
}




