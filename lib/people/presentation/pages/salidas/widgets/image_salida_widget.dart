import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solgis/people/presentation/pages/salidas/widgets/widgets.dart';

class ImageSalidaWidget extends StatelessWidget {

  final bool? onlyShow ;
  
  final String? urlimage;

  const ImageSalidaWidget({
    super.key, 
    this.onlyShow = true, 
    this.urlimage,
  });


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(
      
      borderRadius:  BorderRadius.circular(25),

      child: SizedBox(
    
        width: size.width*0.3,
        height: size.width*0.3,
        
        child: Stack(

          children: [
  
            //FOTO
            SizedBox(
              width: double.infinity,
              height: size.height*0.5,

              child : ImageSalidaFuture(urlimage: urlimage, onlyShow: onlyShow)
            
            ),  
            (onlyShow != true)
              ? 
                //CAMARA
                Positioned(
                  
                  top: 0,
                  right: size.width*0.01,
        
                  child: IconButton(  
        
                    icon:Icon(Icons.camera_alt, color: Colors.white, size: size.width*0.1),
        
                    onPressed: () async {  
        
                      final picker = ImagePicker();

                      final pickedFile = await picker.pickImage(

                        source: ImageSource.camera,
                        imageQuality: 100,

                      );

                      if ( pickedFile == null ){
                        
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                        return;

                      }

                      // personalProvider.updateImage(pickedFile.path);

                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);

                    },
                    
                  ),

                )
              : Container(),

          ],

        ),

      ),

    );

  }

}