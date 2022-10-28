import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/people/domain/helpers/get_responsive_text.dart';
import 'package:solgis/projects/people/domain/providers/registrar_form_provider.dart';

class InputWidget extends StatelessWidget {

  final int? length;
  final String hintext;
  final String? initialvalue;
  final IconData icon;
  final bool isPassword;
  final void Function(String)? onchanged;
  final String? Function(String?)? validator;

  const InputWidget({
    required this.hintext, 
    required this.icon,
    this.isPassword =  false,
    required this.onchanged,
    required this.validator, 
    this.initialvalue, 
    this.length,
  });


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final registerForm = Provider.of<RegistrarFormProvider>(context);

    return Padding(

      padding: EdgeInsets.symmetric(vertical:size.height*0.01, horizontal:size.width*0.02),

      child: TextFormField(

        initialValue: (registerForm.pasaporte.isEmpty)? null:registerForm.pasaporte,

        maxLength: length,

        decoration: InputDecoration(

          counterText: '',
          // contentPadding: EdgeInsets.symmetric(vertical: size.height*0.015),
          hintText: hintext,

          hintStyle: TextStyle(
            fontSize: getResponsiveText(size, size.width*0.06),
            color: Colors.white 
          ),

          errorStyle: TextStyle(
            fontSize: getResponsiveText(size, size.width*0.06)
          ),

          errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ),

          focusedErrorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ),


          enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),

          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),

          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.0,
            ),
          ),

        ),

        style:  TextStyle(
          color: Colors.white,
          fontSize: getResponsiveText(size, size.width*0.08)
        ),

        textInputAction: TextInputAction.next,  
        keyboardType: TextInputType.name,
        obscureText: isPassword,
        validator: validator,
        onChanged: onchanged,

      ),

    );

  }

}
