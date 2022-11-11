import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:solgis/projects/people/domain/models/autorizacion_model.dart';

class AutorizacionService {

  final String _url = '192.168.10.103:8000';
  final String _uncodePath = 'appsol/people/consulta-datos-persona/';

  Future<AutorizacionModel> _procesarRespuestaGet(Uri url) async{
    final resp  = await http.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json; charset= utf-8",
      }
    );

    if(resp.statusCode == 200){
      final decodedData = json.decode(resp.body);
      final consulta = AutorizacionModel.fromJson( decodedData );
      return consulta;
    }else{
      throw Exception('Error al cargar la Consulta');
    }
  }

  // METODO PARA LA CONSULTA DE LA AUTORIZACION
  Future<AutorizacionModel> getConsulta(String codServicio, String codPersonal, String tipoMaster)async{

    final url = Uri.http(_url, _uncodePath,{
      'codServicio' : codServicio,
      'codPersonal' : codPersonal,
      'tipoMaster'  : tipoMaster,
    });

    final resp  = await http.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json; charset= utf-8",
      }
    );

    if(resp.statusCode == 200){
      final decodedData = json.decode(resp.body);
      final consulta = AutorizacionModel.fromJson( decodedData );
      return consulta;
    }else{
      throw Exception('Error al cargar la Consulta');
    }

  }
}