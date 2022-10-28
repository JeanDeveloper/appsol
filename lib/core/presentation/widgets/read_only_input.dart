import 'package:flutter/material.dart';
import 'package:solgis/projects/people/domain/utils/input_decorations_read_only.dart';
// import 'package:solgis/projects/people/domain/utils/input_decorations_read_only.dart';

class InputReadOnlyWidget extends StatelessWidget {
  
  final String? initialValue;
  final double? width;

  const InputReadOnlyWidget({
    Key? key, 
    this.initialValue,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return  SizedBox(

      width: (width != null)? width : size.width*0.57,
      height: size.height*0.04,

      child: TextFormField(

        initialValue: (initialValue == null || initialValue == '') 
          ? ''  
          : initialValue!
            .split(' ')
            .map((e) {
              if(e != '') return e[0]+ e.substring(1).toLowerCase();
            })
            .join(' '),
        readOnly: true,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        decoration:InputDecorationsReadOnly.formInputDecorationReadOnly(),

      )

    );
  }
}