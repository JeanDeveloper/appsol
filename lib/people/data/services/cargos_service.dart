import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:solgis/people/domain/models/cargo_model.dart';


class CargosProvider {

  final String _url = '159.203.105.103:8000';

  final bool cargando = false;


  // peticion GET
  Future<List<CargoModel>> _procesarRespuestaGet(Uri url) async {

    final resp  =  await http.get(

      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json;  charset=utf-8"}

    );

    if(resp.statusCode ==200){

      final decodedData = json.decode(utf8.decode(resp.bodyBytes));
      final empresas = CargosModel.fromJsonList(decodedData);
      return empresas.items;

    }else{
      return [];
    }

  }

  //obtengo los cargos
  Future<List<DropdownMenuItem<int>>> getCargos(String cargo , String codCliente)async{
    
    List<DropdownMenuItem<int>> menuItems = [];

    final url = Uri.http( _url, 'cargos/', {
      'cargo': cargo,
      'codCliente': codCliente,
    } );

    final cargos = await _procesarRespuestaGet(url);

    for (var i=0; i<cargos.length; i++) {


      DropdownMenuItem<int> item =  DropdownMenuItem(value: int.parse(cargos[i].codigo!), child: Text(cargos[i].cargo!));
      menuItems.add(item);

    }

    return menuItems;


  }





}