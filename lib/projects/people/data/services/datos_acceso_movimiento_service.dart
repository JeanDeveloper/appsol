import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:solgis/projects/people/domain/models/datos_acceso_movimiento_model.dart';
import 'package:solgis/projects/people/domain/models/datos_acceso_salida_model.dart';

class DatosAccesoService{

  final String _url = '192.168.10.103:8000';
  final String _uncodePath = 'appsol/people/datos_acceso/';

  Future<DatosAccesoMModel?> getDatosAccesosMovimiento(int codServicio, int codPersonal)async{

    final url = Uri.http(_url, _uncodePath,{
      'codigo_servicio' : codServicio.toString(),
      'codigo_personal' : codPersonal.toString(),
    });

    final resp = await http.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json; charset= utf-8",
      }
    );

    if(resp.statusCode == 200){
      final decodedData = json.decode(resp.body);
      final consulta = DatosAccesoMModel.fromJson(decodedData);
      return consulta;
    }

    return null;

  }

  Future<DatosAccesoSalidaModel?> getDatosAccesoSalida(String codServicio, String documento)async{

    String uncodePath = 'appsol/people/datos_acceso/salida/';

    final url = Uri.http(_url, uncodePath,{
      'codServicio' : codServicio,
      'documento' : documento,
    });

    final resp = await http.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json; charset= utf-8",
      }
    );

    if(resp.statusCode == 200){
      final decodedData = json.decode(resp.body);
      final consulta = DatosAccesoSalidaModel.fromJson(decodedData);
      return consulta;
    }

    return null;

  }

}