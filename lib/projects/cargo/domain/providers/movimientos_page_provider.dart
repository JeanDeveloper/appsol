import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:solgis/projects/cargo/data/models/movimiento_cargo_model.dart';

class MovimientosCargoPageProvider extends ChangeNotifier{

  final String _url = '190.116.178.163:96';
  final String _uncodePath = 'appsol/cargo/movimientos/';
  final bool cargando = false;
  String _search = '';
  int _selectedMenuOpt = 0;
  bool _isShearing = false;
  int _selectedcarga = -1;
  int movimientosContador = 0;
  List<MovimientoCargoModel> movimientosCargoTotalesSelected = [];

  //OBTENER LOS MOVIMIENTOS.
  Future<List<MovimientoCargoModel>> getMovimientosCargo( String codTipoCarga, String codServicio, String tipoConsulta )async{

    final url = Uri.http( _url, _uncodePath, {
      'codTipoCarga': codTipoCarga,
      'codServicio' : codServicio,
      'tipoConsulta': tipoConsulta,
    });

    final response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"}
    );

    final decodedData = json.decode(utf8.decode(response.bodyBytes));
    final movimientosCargo = MovimientosCargoModel.fromJsonList(decodedData);
    movimientosContador = movimientosCargo.items.length;
    notifyListeners();
    if(codTipoCarga == '0') movimientosCargoTotalesSelected = [...movimientosCargo.items];

    return movimientosCargo.items;

  }

  int get selectedCarga =>_selectedcarga;
  set selectedCarga(int valor){
    _selectedcarga = valor;
    notifyListeners();
  }

  int get getSelectedMenuOpt =>_selectedMenuOpt;
  set setSelectedMenuOpt(int valor){
    _selectedMenuOpt = valor;
    notifyListeners();
  }

  bool get getIsShearing => _isShearing;
  set setIsShearing(bool valor){
    _isShearing = valor;
    notifyListeners();
  }

  String get getSearch => _search;
  set setSearch(String valor){
    _search = valor;
    notifyListeners();
  }

  //CONSULTAR UN MOVIMIENTO
  Future<List<MovimientoCargoModel>> getSearchMovimientos(String query)async{

    final List<MovimientoCargoModel> movimientosFilterd = [];
    await Future.delayed(const Duration(seconds: 3));

    for(int i = 0; i< movimientosCargoTotalesSelected.length; i++){
      if( movimientosCargoTotalesSelected[i].placa!.contains(query) || 
          movimientosCargoTotalesSelected[i].dni!.contains(query)   || 
          movimientosCargoTotalesSelected[i].nombres!.contains(query.toUpperCase())
      ) movimientosFilterd.add(movimientosCargoTotalesSelected[i]);
    }
    return movimientosFilterd;
  }

}