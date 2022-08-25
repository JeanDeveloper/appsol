import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:solgis/projects/people/domain/models/area_model.dart';


class AreaService {

  final String _url = '20.168.13.107:8000';
  final String _uncodePath = 'appsol/people/areas/';

  //PETICION GET
  Future<List<AreaDbModel>> _procesarRespuestaGet( Uri url )async{

    final response = await http.get(

      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json;  charset=utf-8"}

    );

    if(response.statusCode == 200){

      final decodedData = json.decode(utf8.decode(response.bodyBytes)) ;

      final areas = AreasDBModel.fromJsonList(decodedData);

      return areas.items;

    }else{
      return[];
    }

  }

  //OBTENCION DE LOS AUTORIZANTES
  Future<List<AreaDbModel>> getAreas(String codServicio, String codCliente)async{

    final url = Uri.http( _url, _uncodePath, {
      'idServicio': codServicio,
      'codCliente': codCliente,
    });

    final areas = await _procesarRespuestaGet(url);
    
    return areas;

  }


}
