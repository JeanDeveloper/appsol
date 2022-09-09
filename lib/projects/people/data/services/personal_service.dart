import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/core/domain/providers/person_auth_provider.dart';
import 'package:solgis/projects/people/domain/models/response_persona_model.dart';
import 'package:solgis/projects/people/domain/providers/crear_personal_provider.dart';


class PersonalProvider{

  final String _url = '20.168.13.107:8000';
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

    final decodedData = json.decode(resp.body);
    final consulta = ResponsePersonalModel.fromJson( decodedData );
    return consulta;

  }

}