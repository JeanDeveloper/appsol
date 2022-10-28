import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/people/domain/providers/crear_personal_provider.dart';
import 'package:solgis/projects/people/styles/style.dart';

class SexoRegister extends StatelessWidget {
  
  const SexoRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final personalProvider = Provider.of<CrearPersonalProvider>(context);    

    return SizedBox(

      width: double.infinity,
      
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Text('Sexo: ', style: styleCrearPersonaltextForm()),
          const SizedBox(width: 60),

          Radio<int>(
            value: 1 , 
            groupValue: personalProvider.valorSexo, 
            onChanged: (value) => personalProvider.valorSexo = value!
          ),

          const Text('Masculino',style: TextStyle(color: Colors.black, fontSize: 12)),

          Radio<int>(
            value: 2, 
            groupValue: personalProvider.valorSexo, 
            onChanged: (value)=> personalProvider.valorSexo = value!
          ),

          const Text('Femenino', style: TextStyle(color: Colors.black, fontSize: 12))

          // DropdownButtonPersonal(
          //   hintText: 'Seleccione el sexo',
          //   onvalidator: (value) {
          //     return (value!= null)
          //     ? null
          //     : "Por favor complete este campo";
          //   },
          //   items: dropdownItemSexo, 
          //   onchanged: (value)=> personalProvider.valorSexo = value!,
          // ),

        ]
      ),
    );
  }

}


List<DropdownMenuItem<int>> get dropdownItemSexo{
  List<DropdownMenuItem<int>> menuItems = [
    const DropdownMenuItem(value: 1, child: Text('Masculino')),
    const DropdownMenuItem(value: 2, child: Text('Femenino')),
  ];
  return menuItems;
}