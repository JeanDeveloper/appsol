import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownButton2Widget extends StatelessWidget {

  final List<DropdownMenuItem<int>>? items;
  final String hinText ;
  final void Function(int?)? onchanged;
  final int? value;
  final TextEditingController? texteditingcontroller;
  final String hintTextForm ;

  const DropdownButton2Widget({
    super.key, 
    this.items, 
    required this.hinText, 
    this.onchanged, 
    this.value, 
    this.texteditingcontroller, 
    required this.hintTextForm
  });



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DropdownButtonHideUnderline(
      child: DropdownButton2< int >(
        buttonPadding: const EdgeInsets.only(left:10),
        buttonElevation: 0,
        dropdownElevation: 0,
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.black
          )
        ),
        style:  TextStyle(color: Colors.black, fontSize:  size.width*0.030),
        items: items, //
        buttonWidth: size.width*0.57,
        isExpanded: true,
        hint: Text(hinText, style: TextStyle(color:Colors.grey, fontSize: size.width*0.030)), //
        onChanged: onchanged, //
        value: value,//
        searchController: texteditingcontroller, //
        
        searchInnerWidget: Padding(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 4,
            right: 8,
            left: 8,
          ),
          
          child: TextFormField(
            textCapitalization: TextCapitalization.characters,
            style: const TextStyle(color: Colors.black),
            controller: texteditingcontroller,
            decoration: InputDecoration(
              hintText: hintTextForm, //
              hintStyle: const TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5)
              ),
              isDense: true,
              contentPadding:  const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
            ),
          ),

        ),
        searchMatchFn: (DropdownMenuItem<dynamic> item, searchValue){
          final hijo = item.child.toString();
          final texto = hijo.substring(5, hijo.lastIndexOf('"')+1);
          return ( texto.contains(searchValue));
        },

        onMenuStateChange: (isOpen) {
          if (!isOpen) texteditingcontroller?.clear();
        }

      ),
    );

  }
}