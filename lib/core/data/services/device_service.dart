import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:solgis/core/domain/models/device_information_provider.dart';
import 'package:solgis/core/domain/models/device_response_model.dart';


class DeviceService {

  final String _url = '192.168.10.58:8000';
  final String _uncodePath = 'appsol/dispositivo/';

  //PETICION GET

  //PETICION POST

  Future<DeviceResponseModel?> sendDataDevice( DeviceInformationModel dispositivo, String number )async{
    
    final url = Uri.http(_url, _uncodePath);

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },

      body: jsonEncode(<String, String>{

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

      })

    );

    if(response.statusCode==201) return DeviceResponseModel.fromJson(json.decode(response.body));
    return null;
    
  }

  Future<int> checkAuthDevice(String serial)async{

    final url = Uri.http(_url, 'appsol/dispositivo/estado/', {
      'serial': serial,
    });

    final response = await http.get( 
      url, 
      headers:  {HttpHeaders.contentTypeHeader: "application/json;  charset=utf-8"}
    );

    final estadoData = json.decode(response.body);

    return estadoData['estado'];

  }


}