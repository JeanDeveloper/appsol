import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/helpers/check_image_ingreso_autorizado.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/core/presentation/widgets/read_only_input.dart';
import 'package:solgis/core/presentation/widgets/shimmer_widget.dart';
import 'package:solgis/projects/people/data/services/cargos_service.dart';
import 'package:solgis/projects/people/data/services/empresa_service.dart';
import 'package:solgis/projects/people/data/services/tipos_personal_service.dart';
import 'package:solgis/projects/people/domain/helpers/guardar_personal.dart';
import 'package:solgis/projects/people/domain/helpers/habilitar_personal.dart';
import 'package:solgis/projects/people/domain/models/persona_model.dart';
import 'package:solgis/projects/people/domain/providers/crear_personal_provider.dart';
import 'package:solgis/projects/people/domain/providers/habilitar_personal_provider.dart';
import 'package:solgis/projects/people/presentation/pages/personal/widgets/widgets.dart';
import 'package:solgis/projects/people/styles/style.dart';

class HabilitarPersonalBody extends StatelessWidget {

  final PersonalModel personal;

  const HabilitarPersonalBody({
    super.key, 
    required this.personal
  });


  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    final globalProvider   = Provider.of<GlobalProvider>(context);
    final hpersonalPv = Provider.of<HabilitarPersonalProvider>(context);
    final empresas = EmpresasProvider();
    final cargos   = CargosProvider();
    final tipoPersonal =TiposPersonalProvider();


    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child:Padding(
        padding: const EdgeInsets.all(20.0),

        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: hpersonalPv.formKey,
          child: Column(
            children: [

              // FOTO
              FutureBuilder(
                future: checkImageStatus(personal.imgPath),
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  if(!snapshot.hasData){
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: size.width*0.33,
                        height: size.width*0.33,
                        child: const Image(image: AssetImage('assets/gifs/loader.gif')),
                      ),
                    );
                  }
                  final int response = snapshot.data!;
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: size.width*0.33,
                      height: size.width*0.33,
                      child: (response == 1) 
                        ? Image(image: NetworkImage(personal.imgPath!), fit: BoxFit.fill)
                        :const Image( image: AssetImage('assets/pngs/no-image-rectangle.png'), fit: BoxFit.fill)
        
                    ),
                  );
                }
              ),
        
              SizedBox(height: size.height*0.02),
        
              //CAMPO DNI
              Row(
        
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
                children: [
        
                  Text( (personal.codigoTipoDocumento == '1')? 'DNI:' : (personal.codigoTipoDocumento == '2')? 'Pasaporte:': 'Carnet:', style: styleCrearPersonaltextForm()),
                  InputReadOnlyWidget(initialValue: personal.docPersonal),
        
                ]
        
              ),
        
              SizedBox(height: size.height*0.02), 
        
              //CAMPO SEXO
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text( 'Sexo', style: styleCrearPersonaltextForm()),
                  InputReadOnlyWidget(initialValue: (personal.sexo == 'M')? 'Masculino' : 'Femenino',),
                ]
              ),
        
              SizedBox(height: size.height*0.02), 
        
              // NOMBRE 1
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('P. Nombre:  ', style: styleCrearPersonaltextForm()),
                  InputReadOnlyWidget(initialValue: personal.nombre1),
                ]
              ),
              SizedBox(height: size.height*0.02), 

              // NOMBRE 2
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('S. Nombre:  ', style: styleCrearPersonaltextForm()),
                  InputReadOnlyWidget(initialValue: personal.nombre2),
                ]
              ),
              SizedBox(height: size.height*0.02), 

              // APELLIDO 1
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('P. Apellido :  ', style: styleCrearPersonaltextForm()),
                  InputReadOnlyWidget(initialValue: personal.apellido1),
                ]
              ),
              SizedBox(height: size.height*0.02), 

              // APELLIDO 2
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('S. Apellido :  ', style: styleCrearPersonaltextForm()),
                  InputReadOnlyWidget(initialValue: personal.apellido2),
                ]
              ),
              SizedBox(height: size.height*0.02), 

              //CAMPO PARA EL TIPO DE PERSONA DROPDOWNBUTTON
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
                children: [
        
                  Text('Tipo Persona:  ', style: styleCrearPersonaltextForm()),
        
                  FutureBuilder(
        
                    future:tipoPersonal.getTiposPersonal(globalProvider.codCliente),
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
                        onchanged: (value)=>hpersonalPv.tipoPersona = value!,
                        onvalidator: (value) {
                          return (value != null)
                          ? null
                          : "Seleccione este campo";
                        },
                      );
        
                    },
                  ),
        
                ],
              ),

              SizedBox(height: size.height*0.02), 

              //CAMPO PARA LA EMPRESA
              Row(
        
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
                children: [
        
                  Text('Empresa: ', style: styleCrearPersonaltextForm()),
        
                  FutureBuilder(
        
                    future: empresas.getEmpresas(globalProvider.codCliente, '') ,
        
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
                        onchanged: (value)=>hpersonalPv.empresa = int.parse(value.toString()),
                        hintText: 'Seleccione la empresa',
                        value:(hpersonalPv.empresa == -1) ? null : hpersonalPv.empresa,
                        onvalidator: (value) {
                          return (value != null)
                          ? null
                          : "Seleccione este campo";
                        },
                      );
        
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
        
                    future:cargos.getCargos('', globalProvider.codCliente),
        
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
                        onchanged: (value)=>hpersonalPv.cargo = value!,
                        hintText: 'Seleccione el cargo',
                        value:(hpersonalPv.cargo == -1) ?null  :hpersonalPv.cargo,
                        onvalidator: (value) {
                          return (value != null)
                          ? null
                          : "Seleccione este campo";
                        },
                      );
        
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
                  if(hpersonalPv.isValidForm()) habilitarPersonal(context, personal);

                },
                child: const Text('Guardar', style: TextStyle(fontSize: 14))
              )

            ],

          ),
        ),
      )
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