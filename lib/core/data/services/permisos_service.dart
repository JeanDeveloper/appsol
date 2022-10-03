import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:solgis/core/domain/models/permisos_model.dart';

class PermisosService{

  static const String _url = '54.221.148.178:8000';
  static const String _uncodePath = 'appsol/usuario/permisos/';

  // PETICION GET
  static Future<List<PermisoModel>> getPermisos(int codTipoUsuario)async{

    final url = Uri.http(
      _url, 
      _uncodePath,
      {'codTipoUsuario': codTipoUsuario.toString()}
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
      final permisos    = PermisosModel.fromJsonList(decodedData);
      
      return permisos.items;
    }

    return [];

  }

}