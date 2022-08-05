import 'package:flutter/material.dart';
import 'package:solgis/home/domain/helpers/input_decoration.dart';


class InputWidget extends StatelessWidget {

  final String? Function(String?)? validator;
  final int? maxLength;
  final TextInputType? keyboardType;
  final Function()? ontap;

  const InputWidget({
    Key? key, 
    this.validator, 
    this.maxLength, 
    this.keyboardType, 
    this.ontap
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return TextFormField(

      decoration: inputDecoration(),

      validator: validator,

      onTap: ontap,

      maxLength: maxLength,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.headline6,

    );
    
  }


}