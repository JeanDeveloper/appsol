import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:solgis/projects/cargo/data/models/tipos_carga_model.dart';

class TiposCargaService{

  static const String _url = '192.168.10.103:8000';
  static const String _uncodePath = 'appsol/cargo/carga/';

  //PETICION GET
  static  Future<List<TipoCargaModel>> getTiposCarga(String codCliente)async{

    final url = Uri.http( _url, _uncodePath, {
      'CodCliente': codCliente,
    });

    final response = await http.get(
      url,
      headers:{
        'Content-Type': "application/json; charset=utf-8",
        'Accept': 'application/json'
      }

    );

    if(response.statusCode == 200){
      final decodedData = json.decode(utf8.decode(response.bodyBytes));
      final cargos = TiposCargaModel.fromJsonList(decodedData);
      return cargos.items;
    }

    return [];

  }

}