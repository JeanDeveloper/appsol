import 'package:flutter/material.dart';

class GlobalProvider extends ChangeNotifier{

  final String _urlapi = '159.203.105.103:8000';
  late int _codDispositivo = 0;
  late String _codServicio = '';
  late String _codCliente = '';
  late int _codSubArea = 0;
  late String _nombreArea= '';
  late String _nombreSubArea= '';
  late String _nombreSucursal= '';
  late String _nombreCliente= '';
  late String? _aliasSede= '';
  late int _codTipoServicio= 0;


  //METODOS PARA LA VARIABLE CODIGO DISPOSITIVO
  int get codDispositivo => _codDispositivo;

  set codDispositivo(int valor){
    _codDispositivo = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE CODIGO DE SUB AREA
  int get codSubArea => _codSubArea;

  set codSubArea(int valor){
    _codSubArea = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE NOMBRE AREA
  String get nombreArea => _nombreArea;

  set nombreArea(String valor){
    _nombreArea = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE NOMBRE SUB AREA
  String get nombreSubArea => _nombreSubArea;

  set nombreSubArea(String valor){
    _nombreSubArea = valor;
    notifyListeners();
  }


  //METODOS PARA LA VARIABLE NOMBRE SUCURSAL
  String get nombreSucursal => _nombreSucursal;

  set nombreSucursal(String valor){
    _nombreSucursal = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE NOMBRE CLIENTE
  String get nombreCliente => _nombreCliente;

  set nombreCliente(String valor){
    _nombreCliente = valor;
    notifyListeners();
  }


  //METODOS PARA LA VARIABLE ALIAS SEDE
  String? get aliasSede => _aliasSede;

  set aliasSede(String? valor){
    _aliasSede = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE CODIGO TIPO DE SERVICIO
  int get codTipoServicio => _codTipoServicio;

  set codTipoServicio(int valor){
    _codTipoServicio = valor;
    notifyListeners();
  }




  //METODOS PARA LA URL DE LA API
  String get urlapi => _urlapi;

  //METODOS PARA LA VARIABLE EMPRESA
  String get codCliente => _codCliente;

  set codCliente(String valor){
    _codCliente = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE SERVICIO
  String get codServicio => _codServicio;

  set codServicio(String valor){
    _codServicio = valor;
    notifyListeners();
  }


}