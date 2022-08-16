import 'package:flutter/material.dart';
import 'package:solgis/projects/people/domain/utils/dropdown_decorations.dart';


class DropdownButtonWidget extends StatelessWidget {

  final List<DropdownMenuItem<int>>? items;
  final String? hintText;
  final void Function(int?) onchanged;
  final String Function(int?)? onvalidator;
  final int? value;

  const DropdownButtonWidget({

    super.key, 
    required this.items, 
    this.hintText, 
    required this.onchanged,
    this.onvalidator,
    this.value,

  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(

      padding: EdgeInsets.symmetric(horizontal: size.width*0.024),
      width: size.width*0.57,
      height: size.height*0.04,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black,
        ),
      ),

      child: DropdownButtonFormField<int>(

        validator: onvalidator,
        hint: hintText!=null ? Text(hintText!, style: const TextStyle(fontSize: 13), maxLines: 1, overflow: TextOverflow.ellipsis,) : null ,
        items: items, 
        onChanged: onchanged,
        style:  const TextStyle(color: Colors.black, fontSize:  13),
        decoration: inputDecorationDropDown(),
        isExpanded: true,
        value: value,

      ),

    );
    
  }

}