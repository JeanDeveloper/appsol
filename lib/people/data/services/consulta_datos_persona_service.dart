import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:solgis/people/domain/models/consulta_validacion_model.dart';

class ConsultaDatosService {

  final String _url = '159.203.105.103:8000';
  final bool cargando = false;

  Future<ConsultaDatosPersonaModel> _procesarRespuestaGet(Uri url) async{

    final resp  = await http.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json; charset= utf-8",
      }

    );

    if(resp.statusCode == 200){
      
      final decodedData = json.decode(resp.body);
      final consulta = ConsultaDatosPersonaModel.fromJson( decodedData );
      
      return consulta;


    }else{

      throw Exception('Error al cargar la Consulta');
    
    }


  }
  
  // METODO PARA LA CONSULTA 
  Future<ConsultaDatosPersonaModel> getConsulta(String codServicio, String codPersonal, String tipoMaster)async{
    
    final url = Uri.http(_url, 'consulta-datos-persona/',{

      'codServicio' : codServicio,
      'codPersonal' : codPersonal,
      'tipoMaster'  : tipoMaster,

    });

    final consulta = await _procesarRespuestaGet(url);
    return consulta;

  }

  

}