import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:solgis/core/domain/models/relation_device_service_provider.dart';

class RelationDeviceService{

  final String _url = '190.116.178.163:96';
  final String _uncodePath = 'solgis/dispositivo/relacion/';

  //PETICION GET
  Future<RelationDeviceServiceModel> getRelation(String serial)async{

    final url = Uri.http(
      _url, 
      _uncodePath,
      {
        'serial': serial,
      }
    );
    final resp = await http.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"
      }
    );

    final decodedData = json.decode(utf8.decode(resp.bodyBytes));
    final relation = RelationDeviceServiceModel.fromJson(decodedData);
    return relation;

  }

}