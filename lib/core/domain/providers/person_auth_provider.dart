import 'package:flutter/material.dart';

enum AuthStatus{

  Authenticated,
  Unauthenticated,

}

class PersonAuthProvider extends ChangeNotifier{

  late String _codigoPersonal = '';
  late String _dni = '';
  late String _pNombre = '';
  late String _sNombre = '';
  late String _pApellido = '';
  late String _sApellido = '';
  late String _cargo = ''; 
  late int _codigoTipoUsuario = 0; 

  //TODO: SE AGREGARÁ LOS PERMISOS(ALCANCE Y ACCIONES) ADEMAS TAMBIEN LAS APPS DISPONIBLES (PENDIENTE)

  AuthStatus status = AuthStatus.Unauthenticated;

  //METODOS PARA LA VARIABLE status
  AuthStatus get estado => status;

  set estado(AuthStatus valor){
    status = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE CODIGO PERSONA
  String get codigoPersonal => _codigoPersonal;

  set codigoPersonal(String valor){
    _codigoPersonal = valor;
    // notifyListeners();
  }

  //METODOS PARA LA VARIABLE DNI
  String get dni => _dni;

  set dni(String valor){
    _dni = valor;
    // notifyListeners();
  }

  //METODOS PARA LA VARIABLE PRIMER NOMBRE
  String get pNombre => _pNombre;

  set pNombre(String valor){
    _pNombre = valor;
    // notifyListeners();
  }

  //METODOS PARA LA VARIABLE SEGUNDO NOMBRE
  String get sNombre => _sNombre;

  set sNombre(String valor){
    _sNombre = valor;
    // notifyListeners();
  }

  //METODOS PARA LA VARIABLE PRIMER APELLIDO
  String get pApellido => _pApellido;

  set pApellido(String valor){
    _pApellido = valor;
    // notifyListeners();
  }

  //METODOS PARA LA VARIABLE SEGUNDO APELLIDO
  String get sApellido => _sApellido;

  set sApellido(String valor){
    _sApellido = valor;
    // notifyListeners();
  }

  //METODOS PARA LA VARIABLE CARGO
  String get cargo => _cargo;

  set cargo(String valor){
    _cargo = valor;
    // notifyListeners();
  }

  //METODOS PARA LA VARIABLE CODIGO TIPO DE USUARIO
  int get codigoTipoUsuario => _codigoTipoUsuario;

  set codigoTipoUsuario(int valor){
    _codigoTipoUsuario = valor;
    // notifyListeners();
  }

}