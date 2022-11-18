import 'package:flutter/material.dart';
import 'package:solgis/projects/people/domain/models/foto_acceso_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class FotoAccesoService {

  static const String _url = '190.116.178.163:96';
  static const String _uncodePath = 'solgis/people/fotos_acceso/';

  static Future<FotoAccesoModel?> getFotoAcceso(String fotoId)async{

    final url = Uri.http(
      _url, 
      _uncodePath,
      {
        'foto_id': fotoId, 
      }
    );

    final resp = await http.get(
      url,
      headers: {
        'Content-Type': "application/json; charset=utf-8",
        'Accept': 'application/json'
      }
    );

    if(resp.statusCode == 200){
      final decodedData = json.decode(utf8.decode(resp.bodyBytes));
      final fotoAcceso    = FotoAccesoModel.fromJson(decodedData);
      return fotoAcceso;
    }

    return null;

  }



  static Future updateFotoAcceso(String codigoMovimiento, String codPersonal, String datoAcceso)async{

    final url = Uri.http(
      _url, 
      '${_uncodePath}copiar_foto/',
      {
        'cod_movimiento': codigoMovimiento, 
        'cod_personal': codPersonal,
        'datoAcceso': datoAcceso,
      }
    );

    final resp = await http.get(
      url,
      headers: {
        'Content-Type': "application/json; charset=utf-8",
        'Accept': 'application/json'
      }
    );

    print(resp.body);

  }

} 