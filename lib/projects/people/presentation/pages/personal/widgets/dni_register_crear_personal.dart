import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/people/domain/providers/crear_personal_provider.dart';
import 'package:solgis/projects/people/domain/providers/radio_provider.dart';
import 'package:solgis/projects/people/presentation/pages/personal/widgets/widgets.dart';
import 'package:solgis/projects/people/styles/style.dart';

class DNIRegister extends StatelessWidget {

  // final String documento;

  DNIRegister({
    Key? key, 
    // required this.documento
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final personalProvider = Provider.of<CrearPersonalProvider>(context, listen: false);  
    // final tipoProvider = Provider.of<RadioProvider>(context, listen: false);  

    return Form(

      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: personalProvider.formKeys[0],


      // child: Row(

      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [

      //     Container(

      //       width: size.width*0.31,
      //       height: size.height*0.08,

      //       alignment: Alignment.centerLeft,
      //       // child: AutoSizeText('Documento:  ', style: styleCrearPersonaltextForm().copyWith(fontSize: size.width*0.0364963503649635))
          

      //       child: DropdownButtonPersonal(
      //         // value: (tipoProvider.valorTipoDocumento == 1) 
      //         //   ?  1
      //         //   : (tipoProvider.valorTipoDocumento == 2)? 2 : 3,
      //         onvalidator: (value) {
      //           return (value!= null)
      //           ? null
      //           : "Por favor complete este campo";
      //         },
      //         // hintText: 'Seleccione el documento',
      //         items: dropdownItemsTipoDocumento, //
      //         onchanged:(value) =>personalProvider.tipoDocumento = value!
      //       ),
      //     ),

      //     Expanded(
      //       child: SizedBox(
      //         width: size.width*0.31,
      //         height: size.height*0.08,

      //         child: TextFormField(
      //           // initialValue: documento,
      //           validator:(value){
      //             return (value!= '')
      //             ? null
      //             : "Por favor complete este campo";
      //           },
      //           keyboardType: (personalProvider.tipoDocumento == 1 || personalProvider.tipoDocumento== 2)  ? TextInputType.number : TextInputType.text ,
      //           maxLength: (personalProvider.tipoDocumento == 1 ) ? 8 : 12,
      //           style: const TextStyle(fontSize: 15, color: Colors.black),
      //           decoration:_inputDecorationDatos(),
      //           onChanged: (value)=> personalProvider.nDocumento=value,
      //         ),
      //       ),
      //     ),

      //   ],
      // ),

      child: Column(

        children: [

          //CAMPO PARA EL TIPO DE DOCUMENTO (DROPDOWNBUTTON)
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              Container(

                width: size.width*0.31,
                height: size.height*0.04,

                alignment: Alignment.centerLeft,
                child: AutoSizeText('Documento:  ', style: styleCrearPersonaltextForm().copyWith(fontSize: size.width*0.0364963503649635))
              ),

              Expanded(
                child: DropdownButtonPersonal(

                  // value: (tipoProvider.valorTipoDocumento == 1) 
                  //   ?  1
                  //   : (tipoProvider.valorTipoDocumento == 2)? 2 : 3,

                  onvalidator: (value) {
                    return (value!= null)
                    ? null
                    : "Por favor complete este campo";
                  },
                  hintText: 'Seleccione el documento',
                  items: dropdownItemsTipoDocumento, //
                  onchanged:(value) {
                    personalProvider.tipoDocumento = value!;
                    FocusNode().requestFocus();

                  }
                ),

              ),

            ],
          ),

          SizedBox(height: size.height*0.03),

          //CAMPO PARA EL NUMERO DEL DOCUMENTO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width*0.31,
                height: size.height*0.04,
                alignment: Alignment.centerLeft,
                child: Text('N°', style: styleCrearPersonaltextForm().copyWith(fontSize: size.width*0.0364963503649635), maxLines: 1,),
              ),

              Expanded(
                child: SizedBox(
                  width: size.width*0.57,
                  child: TextFormField(
                    // initialValue: documento,
                    validator:(value){
                      return (value!= '')
                      ? null
                      : "Por favor complete este campo";
                    },
                    keyboardType: (personalProvider.tipoDocumento == 1 || personalProvider.tipoDocumento== 2)  ? TextInputType.number : TextInputType.text ,
                    maxLength: (personalProvider.tipoDocumento == 1 ) ? 8 : 12,
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                    decoration:_inputDecorationDatos(),
                    onChanged: (value)=> personalProvider.nDocumento=value,
                    onFieldSubmitted: (value) {
                      FocusNode().requestFocus();
                      // print(value);
                    },
                  ),
                ),
              ),

            ],
          ),
        
        ],
      ),

    );
  }
}


List<DropdownMenuItem<int>> get dropdownItemsTipoDocumento{

  List<DropdownMenuItem<int>> menuItems = [
    const DropdownMenuItem(value:1, child: AutoSizeText('DNI')),
    const DropdownMenuItem(value:2, child: AutoSizeText('Carnet de Extranjeria')),
    const DropdownMenuItem(value:3, child: AutoSizeText('Pasaporte')),
  ];
  return menuItems;

}


InputDecoration _inputDecorationDatos()=> const  InputDecoration(

  contentPadding: EdgeInsets.symmetric(vertical:1, horizontal: 5),

  counterText: '',

  // enabledBorder:  OutlineInputBorder(
  //   borderRadius: BorderRadius.all(Radius.circular(5)),
  //   borderSide: BorderSide(
  //     color: Colors.black
  //   )
  // ),

  // focusedBorder:  OutlineInputBorder(
  //   borderRadius: BorderRadius.all(Radius.circular(5)),
  //   borderSide: BorderSide(
  //     color: Colors.blue
  //   )
  // ),

  // errorBorder: UnderlineInputBorder(
  //   // borderRadius: BorderRadius.all(Radius.circular(5)),
  //   borderSide: BorderSide(
  //     color: Colors.red,
  //   )    
  // ),

  // errorBorder:  OutlineInputBorder(
  //   borderRadius: BorderRadius.all(Radius.circular(5)),
  //   borderSide: BorderSide(
  //     color: Colors.red,
  //   )
  // ),


  // focusedErrorBorder: OutlineInputBorder(
  //   borderRadius: BorderRadius.all(Radius.circular(5)),
  //   borderSide: BorderSide(
  //     color: Colors.red
  //   )
  // ),

);