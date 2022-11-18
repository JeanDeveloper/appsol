import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:solgis/core/domain/models/device_information_provider.dart';
import 'package:solgis/core/domain/models/device_response_model.dart';

class DeviceService{

  final String _url = '190.116.178.163:96';
  final String _uncodePath = 'solgis/dispositivo/';

  //PETICION POST
  Future<DeviceResponseModel?> sendDataDevice( DeviceInformationModel dispositivo, String number, String? token )async{

    final url = Uri.http(_url, _uncodePath);

    final response = await http.post(

      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },

      body: jsonEncode( <String, String> {
        'serial'     : dispositivo.serialNumber!,
        'hardware'   : dispositivo.hardware!,
        'modelo'     : dispositivo.model!,
        'fabricante' : dispositivo.brand!,
        'version_api': dispositivo.release!,
        'numero'     : number,
        'sdk'        : dispositivo.sdkInt!,
        'incremental': dispositivo.incremental!,
        'dispositivo': dispositivo.device!,
        'id'         : dispositivo.id!,
        'id_fb'      : token?? '',
      })

    );

    return DeviceResponseModel.fromJson( json.decode( response.body ) );

  }

  Future<int> checkAuthDevice(String serial)async{
    final url = Uri.http(
      _url, 
      'solgis/dispositivo/estado/', 
      {
        'serial': serial
      }
    );

    final response = await http.get(
      url, 
      headers: {
        HttpHeaders.contentTypeHeader: "application/json;  charset=utf-8"
      }
    );

    final estadoData = json.decode(response.body);
    return estadoData['estado'];
  }

}