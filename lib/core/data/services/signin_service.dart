import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:solgis/core/domain/models/login_dni_response.dart';

class SignInService{

  final String _url = '192.168.10.103:8000';
  final String _uncodePath = 'appsol/autenticacion/';

  //PETICION GET
  Future<LoginDniResponse?> signInDNI(String dni) async {

    final url = Uri.http(_url, _uncodePath,{
      'dni' : dni,
    });
    final resp = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"}
    );
    print(resp.body);
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));
    if(decodedData.length == 1) return null;
    final signinwithdni = LoginDniResponse.fromJson(decodedData);
    return signinwithdni;

  }

}