import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:solgis/projects/people/domain/utils/dropdown_decorations.dart';

class DropdownButtonPersonal extends StatelessWidget {

  final List<DropdownMenuItem<int>>? items;
  final String? hintText;
  final void Function(int?) onchanged;
  final String? Function(int?)? onvalidator;
  final int? value;

  const DropdownButtonPersonal({
    super.key, 
    required this.items, 
    this.hintText, 
    required this.onchanged,
    this.onvalidator,
    this.value
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return SizedBox(
      
      width: size.width*0.57,

      child: DropdownButtonFormField<int>(
        value: (value != null) ? value : null ,
        validator: onvalidator,
        hint: hintText!=null ? AutoSizeText(hintText!, style: TextStyle( color: Colors.grey, fontSize: size.width*0.03)) : null ,
        items: items, 
        onChanged: onchanged,
        style:  TextStyle(color: Colors.black, fontSize:  size.width*0.030),
        // decoration: inputDecorationDropDownPersonal(),
        isExpanded: true,
        
      ),
    );

  }

}