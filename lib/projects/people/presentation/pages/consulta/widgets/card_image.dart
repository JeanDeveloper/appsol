import 'package:flutter/material.dart';
import 'package:solgis/core/domain/helpers/get_image.dart';

class CardImage extends StatelessWidget {

  final String? urlImage;

  const CardImage({super.key, this.urlImage});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    //FOTO
    return FutureBuilder(
      future: getImage(urlImage),
      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
        if(snapshot.hasData){
          return Container(
            width: size.width*0.33,
            height: size.width*0.33,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: snapshot.data,
          );
        }else{
          return const CircularProgressIndicator();
        }
      }
    );

  }
}