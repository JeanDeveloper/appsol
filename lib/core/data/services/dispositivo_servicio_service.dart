import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:solgis/core/domain/models/relation_device_service_provider.dart';


class RelationDeviceService{

  final String _url = '192.168.10.103:8000';
  final String _uncodePath = 'appsol/dispositivo/relacion/';

  //PETICION GET
  Future<RelationDeviceServiceModel> getRelation(String serial)async{

    final url = Uri.http(_url, _uncodePath,{
      'serial': serial,
    });
    final resp = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"}
    );
    print(resp.body);
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));
    final relation = RelationDeviceServiceModel.fromJson(decodedData);
    return relation;
  }


}