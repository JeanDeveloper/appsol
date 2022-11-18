import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:solgis/projects/people/domain/models/empresa_model.dart';


class EmpresasProvider {

  final String _url = '190.116.178.163:96';
  final String _uncodePath = 'solgis/people/empresas/';


  final bool cargando     = false;

  // peticion GET
  Future<List<EmpresaModel>> _procesarRespuestaGet(Uri url) async {

    final resp  =  await http.get(

      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json;  charset=utf-8"}

    );

    if(resp.statusCode ==200){

      final decodedData = json.decode(utf8.decode(resp.bodyBytes));
      final empresas = EmpresasModel.fromJsonList(decodedData);
      return empresas.items;

    }else{
      return [];
    }

  }
                      
  //obtener las empresas
  Future<List<DropdownMenuItem<int>>> getEmpresas(String codEmpresa, String nomEmpresa)async{
    
    List<DropdownMenuItem<int>> menuItems = [];

    final url = Uri.http( _url, _uncodePath, {
      'nombreEmpresa': nomEmpresa,
      'codEmpresa': codEmpresa,
    } );

    final empresas = await _procesarRespuestaGet(url);

    for (var i=0; i<empresas.length; i++) {
      DropdownMenuItem<int> item =  DropdownMenuItem(value: int.parse(empresas[i].codigo!), child: Text(empresas[i].empresa!));
      menuItems.add(item);
    }
    return menuItems;
  }

}