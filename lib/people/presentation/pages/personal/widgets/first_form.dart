import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:solgis/people/domain/providers/crear_personal_provider.dart';
import 'package:solgis/people/presentation/pages/personal/widgets/widgets.dart';
import 'package:solgis/theme/style_people.dart';


class FirstForm extends StatelessWidget {

  const FirstForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(

      // color: Colors.red,

      width: double.infinity,
      height: size.height*0.72,

      child: Column(

        children: [

          const _ImageCardPersonalRegister(),

          SizedBox(height: size.height*0.04),

          _DNIRegister(),

        ],

      )

    );

  }
}

class _DNIRegister extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final personalProvider = Provider.of<CrearPersonalProvider>(context, listen: false);    

    return Form(

      autovalidateMode: AutovalidateMode.onUserInteraction,

      key: personalProvider.formKeys[0],

      child: Column(
    
        children: [
    
          //CAMPO PARA EL TIPO DE DOCUMENTO (DROPDOWNBUTTON)
          Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
            children: [
        
              Container(
                
                width: size.width*0.30,
                height: size.height*0.04,
                alignment: Alignment.centerLeft,
    
                child: AutoSizeText('DOCUMENTO:  ', style: styleCrearPersonaltextForm().copyWith(fontSize: size.width*0.0364963503649635))
              ),
    
              Expanded(
                child: DropdownButtonPersonal(
              
                  onvalidator: (value) {
                  
                    return (value!= null)
                    ? null
                    : "Por favor complete este campo";
                    
                  },
              
                  hintText: 'SELECCIONE EL TIPO DE DOCUMENTO',
                  items: dropdownItemsTipoDocumento, 
                  onchanged:(value) =>personalProvider.tipoDocumento = value!
                
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

                width: size.width*0.30,
                height: size.height*0.04,
                alignment: Alignment.centerLeft,
                
                child: Text('N°', style: styleCrearPersonaltextForm().copyWith(fontSize: size.width*0.0364963503649635), maxLines: 1,),
              
              ),

              Expanded(
                child: SizedBox(
              
                  width: size.width*0.57,
                  
                  child: TextFormField(
                  
                    validator:(value){
                      
                      return (value!= '')
                      ? null
                      : "Por favor complete este campo";
                      
                    },
                    
                    keyboardType: (personalProvider.tipoDocumento == 1 || personalProvider.tipoDocumento== 2)  ? TextInputType.number : TextInputType.text ,
                    maxLength: (personalProvider.tipoDocumento == 1 ) ? 8 : 12,
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                    decoration:inputDecorationDatos(),
                    onChanged: (value)=> personalProvider.nDocumento=value,
              
                  
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


class _ImageCardPersonalRegister extends StatelessWidget {

  const _ImageCardPersonalRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final personalProvider = Provider.of<CrearPersonalProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      
      borderRadius:  BorderRadius.circular(25),

      child: SizedBox(
    
        width: double.infinity,
        height: size.height*0.45,
        
        child: Stack(
    
          children: [
    
            //FOTO
            SizedBox(
              width: double.infinity,
              height: size.height*0.5,
              child: ImageCreatedWidget(urlimage:(personalProvider.foto==null)? null : personalProvider.foto!.path ),
            ),  
            
            //CAMARA
            Positioned(
              
              top: size.height*0.001,
              right: size.width*0.06,
    
              child: IconButton(  
    
                icon:Icon(Icons.camera_alt, color: Colors.white, size: size.width*0.15),
    
                onPressed: () async {  
    
                  final picker = ImagePicker();
    
                  await NDialog(
    
                    dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.white),
                    title:  const Text("INFORMACION",  style: TextStyle(color: Colors.black)),
                    content:  const Text("Que accion desea hacer?", style: TextStyle(color: Colors.black)),
                    
                    actions: <Widget>[
    
                      TextButton(
    
                        child: const Text("Ir a Camara"),
    
                        onPressed: ()async{
    
                          final pickedFile = await picker.pickImage(

                            source: ImageSource.camera,
                            imageQuality: 100,

                          );
    
                          if ( pickedFile == null ){

                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                            return;

                          }
    
                          personalProvider.updateImage(pickedFile.path);
    
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
    
                        }
    
                      ),

                      TextButton(
    
                        child: const Text("Abrir Galeria"),
    
                        onPressed: ()async{
    
                          final pickedFile = await picker.pickImage(
                            source: ImageSource.gallery,
                            imageQuality: 100,
                          );
    
                          if (pickedFile == null){
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                            return;
                          }

                          personalProvider.updateImage(pickedFile.path);
    
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
    
                        }
    
                      ),
                    
                    ],
                  
                  ).show(context);
                
                },
                
              ),
    
            )
          ],
    
        ),
    
      ),

    );
  
  }

}


List<DropdownMenuItem<int>> get dropdownItemSexo{

  List<DropdownMenuItem<int>> menuItems = [
    const DropdownMenuItem(value: 1, child: Text('MASCULINO')),
    const DropdownMenuItem(value: 2, child: Text('FEMENINO')),
  ];

  return menuItems;

}


InputDecoration inputDecorationDatos()=> const  InputDecoration(

  contentPadding: EdgeInsets.symmetric(vertical:1, horizontal: 5),

  counterText: '',

  enabledBorder:  OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(
      color: Colors.black
    )
  ),

  focusedBorder:  OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(
      color: Colors.blue
    )
  ),

  errorBorder:  OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(
      color: Colors.red,
    )
  ),


  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(
      color: Colors.red
    )
  ),

);


List<DropdownMenuItem<int>> get dropdownItemsTipoDocumento{

  List<DropdownMenuItem<int>> menuItems = [
    const DropdownMenuItem(value:1, child: Text('DNI')),
    const DropdownMenuItem(value:2, child: Text('CARNET DE EXTRANJERIA')),
    const DropdownMenuItem(value:3, child:Text('PASAPORTE')),
  ];

  return menuItems;

}

