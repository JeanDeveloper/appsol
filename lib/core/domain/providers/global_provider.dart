import 'package:flutter/material.dart';

class GlobalProvider extends ChangeNotifier{

  late int codDispositivo = 0;
  late String codServicio = '';
  late String codCliente = '';
  late int codSubArea = 0;
  late String nombreArea= '';
  late String nombreSubArea= '';
  late String nombreSucursal= '';
  late String nombreCliente= '';
  late String? aliasSede= '';
  late int codTipoServicio= 0;
  String _nombrePuesto = '';

  //METODOS PARA LA VARIABLE NOMBRE PUESTO


  String get nombrePuesto => _nombrePuesto;
  set nombrePuesto ( String value ){
    _nombrePuesto = value;
    notifyListeners();
  }


  //METODOS PARA LA VARIABLE CODIGO DISPOSITIVO
  int get getcodDispositivo => codDispositivo;

  set setcodDispositivo(int valor){
    codDispositivo = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE CODIGO DE SUB AREA
  int get getcodSubArea => codSubArea;

  set setcodSubArea(int valor){
    codSubArea = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE NOMBRE AREA
  String get getnombreArea => nombreArea;

  set setnombreArea(String valor){
    nombreArea = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE NOMBRE SUB AREA
  String get getnombreSubArea => nombreSubArea;

  set setnombreSubArea(String valor){
    nombreSubArea = valor;
    notifyListeners();
  }


  //METODOS PARA LA VARIABLE NOMBRE SUCURSAL
  String get getnombreSucursal => nombreSucursal;

  set setnombreSucursal(String valor){
    nombreSucursal = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE NOMBRE CLIENTE
  String get getnombreCliente => nombreCliente;

  set setnombreCliente(String valor){
    nombreCliente = valor;
    notifyListeners();
  }


  //METODOS PARA LA VARIABLE ALIAS SEDE
  String? get getaliasSede => aliasSede;

  set setaliasSede(String? valor){
    aliasSede = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE CODIGO TIPO DE SERVICIO
  int get getcodTipoServicio => codTipoServicio;

  set setcodTipoServicio(int valor){
    codTipoServicio = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE EMPRESA
  String get getcodCliente => codCliente;

  set setcodCliente(String valor){
    codCliente = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE SERVICIO
  String get getcodServicio => codServicio;

  set setcodServicio(String valor){
    codServicio = valor;
    notifyListeners();
  }


}