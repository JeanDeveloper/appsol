import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/core/presentation/widgets/shimmer_widget.dart';
import 'package:solgis/projects/people/domain/helpers/guardar_personal.dart';
import 'package:solgis/projects/people/domain/providers/crear_personal_provider.dart';
import 'package:solgis/projects/people/presentation/pages/personal/widgets/widgets.dart';
import 'package:solgis/projects/people/styles/style.dart';

class CrearPersonalBody extends StatelessWidget {

  // final String documento;

  CrearPersonalBody({
    super.key, 
    // required this.documento
  });


  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    final personalProvider = Provider.of<CrearPersonalProvider>(context);
    final globalProvider   = Provider.of<GlobalProvider>(context);

    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: personalProvider.formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(

            children: [

              const ImageCardPersonalRegister(),
              SizedBox(height: size.height*0.05),

              DNIRegister(),
              SizedBox(height: size.height*0.01),

              const SexoRegister(),
              SizedBox(height: size.height*0.01),

              //CAMPO PARA EL TIPO DE PERSONA DROPDOWNBUTTON
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Text('Tipo Persona:  ', style: styleCrearPersonaltextForm()),

                  FutureBuilder(

                    future:personalProvider.initTiposPersonal(globalProvider.codCliente),
                    builder: (BuildContext context, AsyncSnapshot<List<DropdownMenuItem<int>>> snapshot) {

                      if(!snapshot.hasData){
                        return ShimmerWidget(
                          width: size.width*0.57, 
                          height: size.height*0.04
                        );
                      }
                      final dropdowntipoPersonas = snapshot.data;
                      
                      return DropdownButtonPersonal(
                        items: dropdowntipoPersonas,
                        hintText: 'Seleccione el tipo de persona',
                        onchanged: (value)=>personalProvider.tipoPersona = value!,
                        onvalidator: (value) {
                          return (value!= null)
                          ? null
                          : "Por favor complete este campo";
                        },
                      );

                    },
                  ),

                ],
              ),

              SizedBox(height: size.height*0.02), 

              //CAMPO PARA EL PRIMER NOMBRE
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Text('Nombre:  ', style: styleCrearPersonaltextForm()),

                  SizedBox(

                    width: size.width*0.57,

                    child: TextFormField(

                      textCapitalization: TextCapitalization.characters,
                      onChanged: (value)=>personalProvider.pNombre=value,
                      cursorHeight: 20,
                      style: TextStyle(fontSize: size.width*0.030, color: Colors.black),
                      decoration:_inputDecorationDatos() ,

                    )

                  )

                ]
              ),
              SizedBox(height: size.height*0.02), 

              //CAMPO PARA EL SEGUNDO NOMBRE              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
          
                  Text('S. Nombre:  ', style: styleCrearPersonaltextForm()),
                  
                  SizedBox(
                    width: size.width*0.57,
              
                    child: TextFormField(
          
                      textCapitalization: TextCapitalization.characters,
                      cursorHeight: 20,
                      style: TextStyle(fontSize: size.width*0.030, color: Colors.black),
                      decoration:_inputDecorationDatos(),
                      onChanged: (value)=> personalProvider.sNombre=value,
          
                    )
              
                  )
                
                ]
              ),
              SizedBox(height: size.height*0.02), 

              //CAMPO PARA EL PRIMER APELLIDO
              Row(
          
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
                children: [
          
                  Text('A. Paterno:  ', style: styleCrearPersonaltextForm()),
          
                  SizedBox(
          
                    width: size.width*0.57,
          
                    child: TextFormField(
                      validator: (value) {
                        return (value!= '')
                        ? null
                        : "El primer apellido es obligatorio";
                      },
                      textCapitalization: TextCapitalization.characters,
                      cursorHeight: 20,
                      style:  TextStyle(fontSize: size.width*0.030, color: Colors.black),
                      decoration:_inputDecorationDatos() ,
                      onChanged: (value)=>personalProvider.pApellido=value,
                    )

                  )
                
                ]
          
              ),
              SizedBox(height: size.height*0.02), 

              //CAMPO PARA EL SEGUNDO APELLIDO
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
          
                  Text('A. Materno:  ', style: styleCrearPersonaltextForm()),
                  SizedBox(
                    width: size.width*0.57,
                    // height: size.height*0.04,
                    child: TextFormField(
                      textCapitalization: TextCapitalization.characters,
              
                      cursorHeight: 20,
                      style:  TextStyle(fontSize:size.width*0.030, color: Colors.black),
                      decoration:_inputDecorationDatos(),
                      onChanged: (value)=> personalProvider.sApellido=value,
          
                    )
                  )
                
                ]
              ),
              SizedBox(height: size.height*0.02), 

              //CAMPO PARA LA EMPRESA
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Text('Empresa: ', style: styleCrearPersonaltextForm()),

                  FutureBuilder(

                    future:personalProvider.initEmpresas(globalProvider.codCliente, ''),

                    builder: (BuildContext context,  AsyncSnapshot<List<DropdownMenuItem<int>>> snapshot) {

                      if(!snapshot.hasData){
                        return ShimmerWidget(
                          width: size.width*0.57, 
                          height: size.height*0.04
                        );
                      } 
                      final dropdownempresas = snapshot.data;

                      return DropdownButtonPersonal(
                        items: dropdownempresas, 
                        onchanged: (value)=>personalProvider.empresa = int.parse(value.toString()),
                        hintText: 'Seleccione la empresa',
                        value:(personalProvider.empresa == -1) ?null  :personalProvider.empresa ,
                      );

                      // return DropdownButton2Widget(
                      //   hinText: 'Seleccione la empresa',
                      //   items: dropdownempresas,
                      //   hintTextForm: 'Busque la empresa',
                      //   onchanged: (value)=>personalProvider.empresa = value!,
                      //   texteditingcontroller: personalProvider.searchEditingControllerEmpresa,
                      //   value: (personalProvider.empresa == -1) ?null  :personalProvider.empresa,
                      // );

                    }, 

                  ),

                ]

              ),
              SizedBox(height: size.height*0.04), 

              //CAMPO PARA EL CARGO
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Text('Cargo ', style: styleCrearPersonaltextForm()),

                  FutureBuilder(

                    future:personalProvider.initCargos('', globalProvider.codCliente),

                    builder: (BuildContext context,  AsyncSnapshot<List<DropdownMenuItem<int>>> snapshot) {
                      if(!snapshot.hasData){
                        return ShimmerWidget(
                          width: size.width*0.57, 
                          height: size.height*0.04
                        );
                      } 

                      final dropdowncargos = snapshot.data;

                      return DropdownButtonPersonal(
                        items: dropdowncargos, 
                        onchanged: (value)=>personalProvider.cargo = value!,
                        hintText: 'Seleccione el cargo',
                        value:(personalProvider.cargo == -1) ?null  :personalProvider.cargo ,
                      );

                      // return DropdownButton2Widget(
                      //   items: dropdowncargos,
                      //   hinText: 'Seleccione el cargo',
                      //   hintTextForm: 'Busque el cargo',
                      //   onchanged: (value)=>personalProvider.cargo = value!,
                      //   texteditingcontroller: personalProvider.searchEditingControllerCargo,
                      //   value: (personalProvider.cargo == -1) ? null : personalProvider.cargo,
                      // );

                    }, 

                  ),

                ]

              ),

              SizedBox(height: size.height*0.04), 

              //BOTON PARA EL REGISTRO
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  primary: Colors.white,
                  padding: const EdgeInsets.all(14.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: (){
                  if(personalProvider.isValidForm()) guardarPersonal(context, personalProvider.foto);
                  
                },
                child: const Text('Registar', style: TextStyle(fontSize: 14))
              )

            ],

          ),
        ),
      ),
    );

  }

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