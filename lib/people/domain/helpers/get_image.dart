import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Widget> getImage(String? urlimage, {bool create = false} ) async {

  if(urlimage==null){

    if(create){

      return const  Image(
      
        image: AssetImage('assets/pngs/no-image-create.png'),
        fit: BoxFit.cover,
      
      );

    }

    return const  Image(
    
      image: AssetImage('assets/pngs/no-image.png'),
      fit: BoxFit.cover,
    
    );


  }else{

    if ( urlimage.startsWith( 'http' ) ){

      final uri = Uri.parse(urlimage);
      final resp = await http.get(uri);

      if(resp.statusCode==200){

        return Image(
          image: NetworkImage( urlimage ),
          fit: BoxFit.fill,
        );
      
      }else{
        return const Image(
          image: AssetImage('assets/pngs/no-image-rectangle.png'),
          fit: BoxFit.fill,
        );
      }

    }else{
        
      return Image.file(
      
        File( urlimage ),
        fit: BoxFit.fill,
      
      );

    }

  }


}