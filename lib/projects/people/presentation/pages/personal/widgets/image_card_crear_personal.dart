import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/people/domain/providers/crear_personal_provider.dart';
import 'package:solgis/projects/people/presentation/pages/personal/widgets/widgets.dart';

class ImageCardPersonalRegister extends StatelessWidget {

  const ImageCardPersonalRegister({
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
                    title:  const Text("Información",  style: TextStyle(color: Colors.black)),
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
