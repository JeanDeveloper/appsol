import 'package:flutter/material.dart';
import 'package:solgis/people/domain/utils/dropdown_decorations.dart';


class DropdownButtonPersonal extends StatelessWidget {

  final List<DropdownMenuItem<int>>? items;
  final String? hintText;
  final void Function(int?) onchanged;
  final String? Function(int?)? onvalidator;

  const DropdownButtonPersonal({

    super.key, 
    required this.items, 
    this.hintText, 
    required this.onchanged,
    this.onvalidator,

  });
  


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return SizedBox(
      
      width: size.width*0.57,

      child: DropdownButtonFormField<int>(

        hint: hintText!=null ? Text(hintText!, style: TextStyle(fontSize: size.width*0.030)) : null ,
        style:  TextStyle(color: Colors.black, fontSize:  size.width*0.030),
        decoration: inputDecorationDropDownPersonal(),
        validator: onvalidator,
        onChanged: onchanged,
        isExpanded: true,
        items: items, 
      
      ),

    );

  }

}