import 'package:flutter/material.dart';

class PersonAuthProvider extends ChangeNotifier{
  late String _codigoPersona = '';
  late int _codigoUsuario = 0;
  late String _dni = '';
  late String _nombre = '';
  late String _pApellido = '';
  late String _sApellido = '';
  late int _rol = 0;
  late String _codigoCliente = '';


  //METODOS PARA LA VARIABLE CODIGO PERSONA
  String get codigoPersona => _codigoPersona;

  set codigoPersona(String valor){
    _codigoPersona = valor;
    notifyListeners();
  }


  //METODOS PARA LA VARIABLE CODIGO USUARIO
  int get codigoUsuario => _codigoUsuario;

  set codigoUsuario(int valor){
    _codigoUsuario = valor;
    notifyListeners();
  }


  //METODOS PARA LA VARIABLE DNI
  String get dni => _dni;

  set dni(String valor){
    _dni = valor;
    notifyListeners();
  }


  //METODOS PARA LA VARIABLE NOMBRE
  String get nombre => _nombre;

  set nombre(String valor){
    _nombre = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE P APELLIDO
  String get pApellido => _pApellido;

  set pApellido(String valor){
    _pApellido = valor;
    notifyListeners();
  }


  //METODOS PARA LA VARIABLE S APELLIDO
  String get sApellido => _sApellido;

  set sApellido(String valor){
    _sApellido = valor;
    notifyListeners();
  }


  //METODOS PARA LA VARIABLE ROL
  int get rol => _rol;

  set rol(int valor){
    _rol = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE CODIGO CLIENTE
  String get codigoCliente => _codigoCliente;

  set codigoCliente(String valor){
    _codigoCliente = valor;
    notifyListeners();
  }

}