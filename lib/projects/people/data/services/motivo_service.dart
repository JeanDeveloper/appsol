import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:solgis/projects/people/domain/models/motivo_model.dart';

class MotivoService{

  final String _url = '192.168.10.103:8000';
  final String _uncodePath = 'solgis/people/motivos/';


  //PETICION GET
  Future<List<MotivoDbModel>> _procesarRespuestaGet( Uri url )async{

    final response = await http.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json;  charset=utf-8"
      }
    );
    if(response.statusCode == 200){
      final decodedData = json.decode(utf8.decode(response.bodyBytes)) ;
      final motivos = MotivosDbModel.fromJsonList(decodedData);
      return motivos.items;
    }else{
      return[];
    }
  }

  //OBTENCION DE LOS MOTIVOS
  Future<List<MotivoDbModel>> getMotivos(String codServicio, String idCliente)async{
    final url = Uri.http( _url, _uncodePath, {
      'idServicio': codServicio,
      'idCliente': idCliente,
    });
    final motivos = await _procesarRespuestaGet(url);
    return motivos;
  }

}