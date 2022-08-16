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

      padding: EdgeInsets.symmetric(vertical:size.height*0.01, horizontal:size.width*0.07),

      child: TextFormField(

        initialValue: (registerForm.pasaporte.isEmpty)? null:registerForm.pasaporte,
        textCapitalization: TextCapitalization.characters,

        maxLength: length,

        decoration: InputDecoration(

          counterText: '',
          contentPadding: EdgeInsets.symmetric(vertical: size.height*0.015),
          fillColor: Colors.white,
          filled: true,
          hintText: hintext,

          hintStyle: TextStyle(

            fontSize: getResponsiveText(size, size.width*0.045),
            color: Colors.black 

          ),
      
          errorStyle: TextStyle(
            
            fontSize: getResponsiveText(size, size.width*0.045 )

          ),
      
      
          prefixIcon: Padding(
            
            padding: EdgeInsets.symmetric(horizontal: size.width*0.07),
      
            child: Icon(

              icon,
              size:getResponsiveText(size, size.width*0.068),
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
          fontSize: getResponsiveText(size, size.width*0.045)
      
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
