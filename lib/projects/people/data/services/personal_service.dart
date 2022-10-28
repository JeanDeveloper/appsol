import 'dart:convert';
import 'dart:async';
import  'package:http_parser/http_parser.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/core/domain/providers/person_auth_provider.dart';
import 'package:solgis/projects/people/domain/models/response_persona_model.dart';
import 'package:solgis/projects/people/domain/providers/crear_personal_provider.dart';

class PersonalProvider{

  final String _url = '190.116.178.163:96';

  final String _uncodePath = 'appsol/people/personal/';
  
  final bool cargando = false;

  //CONSULTA POST
  Future<ResponsePersonalModel> procesarRegistroPersonal(BuildContext context ) async{

    final personalProvider = Provider.of<CrearPersonalProvider>(context, listen: false);
    final globalProvider   = Provider.of<GlobalProvider>(context, listen: false);
    final loginProvider    = Provider.of<PersonAuthProvider>(context, listen: false);
    final url = Uri.http(_url, _uncodePath);

    final body = jsonEncode({
        'codigo_personal': 0,
        'codigo_tipo_personal': personalProvider.tipoPersona,
        'codigo_empresa': personalProvider.empresa,
        'codigo_tipo_documento': personalProvider.tipoDocumento,
        'codigo_cargo': personalProvider.cargo,
        'nombre1': personalProvider.pNombre,
        'nombre2': personalProvider.SNombre,
        'apellido1': personalProvider.pApellido,
        'apellido2': personalProvider.sApellido,
        'doc_personal': personalProvider.nDocumento,
        'sexo': (personalProvider.sexo==1)? 'M' : 'F',
        'creado_por': 'PEOPLE_${loginProvider.dni}',
        'brevete': '',
        'es_autorizante': 0,
        'habilitado': 1,
        'tiene_foto': (personalProvider.foto==null) ? 0 : 1,
        'codigo_cliente_control': globalProvider.codCliente,
    });

    final resp = await http.post(
      url,
      headers: {
        'Content-Type': "application/json; charset=utf-8",
        'Accept': 'application/json'
      },
      body: body,
    );

    print(resp.body);

    final decodedData = json.decode(resp.body);
    final consulta = ResponsePersonalModel.fromJson( decodedData );
    return consulta;

  }

  //SUBIR FOTO DEL PERSONAL AL SERVIDOR
  Future<void> uploadPhotoPersonal(File file, String nombre)async {

      final url = Uri.parse('http://190.116.178.163:92/api/personal/upload-photo-personal');
      final imageUploadRequest = http.MultipartRequest('POST', url);

      final filemultipart = await http.MultipartFile.fromPath(
        'file', 
        file.path,
        contentType: MediaType('image', 'jpg')
      );

      imageUploadRequest.fields['nombre'] = '$nombre.jpg';
      imageUploadRequest.files.add(filemultipart);
      final streamResponse = await imageUploadRequest.send();
      final resp = await http.Response.fromStream(streamResponse);

      print(resp);
      print(resp.statusCode);
      print(resp.body);

    
  } 

  // //GUARDANDO LA FOTO DEL PERSONAL AL SERVIDOR DE SOLMAR.
  // Future<ResponsePersonalModel> uploadFotoPersonal(BuildContext context, String codPersonal){
  //   const String url = '190.116.178.163:96';
  //   const String uncodePath = 'appsol/people/personal/';

    

    

  // }






}