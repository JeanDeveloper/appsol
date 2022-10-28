import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:solgis/projects/people/domain/models/datos_acceso_movimiento_model.dart';

class DatosAccesoService {

  final String _url = '190.116.178.163:96';
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

}