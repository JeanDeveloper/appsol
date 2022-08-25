import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:solgis/projects/people/domain/models/consulta_persona_model.dart';

class ConsultaDOIService {

  final String _url = '20.168.13.107:8000';
  final String _uncodePath = 'appsol/people/detalle-personal/';

  final bool cargando = false;

  late ConsultaModel consulta;

  Future<ConsultaModel> _procesarRespuestaGet(Uri url) async{

    final resp  = await http.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json; charset= utf-8",
      }

    );

    if(resp.statusCode ==200){
      
      final decodedData = json.decode(resp.body);
      final consulta = ConsultaModel.fromJson( decodedData[0] );
      return consulta;

    }else{

      throw Exception('Error al cargar la Consulta');
    
    }


  }
  
  // METODO PARA LA CONSULTA 
  Future<ConsultaModel>  getConsulta(String doc, String idServicio)async{
    
    final url = Uri.http(_url, _uncodePath,{

      'doc': doc,
      'idServicio' : idServicio,

    });

    final consulta = await _procesarRespuestaGet(url);
    
    return consulta;

  }

}