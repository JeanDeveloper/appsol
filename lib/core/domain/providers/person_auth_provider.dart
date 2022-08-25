import 'package:flutter/material.dart';

enum AuthStatus{

  Authenticated,
  Unauthenticated,

}

class PersonAuthProvider extends ChangeNotifier{
  late String codigoPersona = '';
  late int codigoUsuario = 0;
  late String dni = '';
  late String nombre = '';
  late String pApellido = '';
  late String sApellido = '';
  late int rol = 0;
  late String codigoCliente = '';

  AuthStatus status = AuthStatus.Unauthenticated;

  //METODOS PARA LA VARIABLE status
  AuthStatus get estado => status;

  set estado(AuthStatus valor){
    status = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE CODIGO PERSONA
  String get getcodigoPersona => codigoPersona;

  set setcodigoPersona(String valor){
    codigoPersona = valor;
    notifyListeners();
  }


  //METODOS PARA LA VARIABLE CODIGO USUARIO
  int get getcodigoUsuario => codigoUsuario;

  set setcodigoUsuario(int valor){
    codigoUsuario = valor;
    notifyListeners();
  }


  //METODOS PARA LA VARIABLE DNI
  String get getdni => dni;

  set setdni(String valor){
    dni = valor;
    notifyListeners();
  }


  //METODOS PARA LA VARIABLE NOMBRE
  String get getnombre => nombre;

  set setnombre(String valor){
    nombre = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE P APELLIDO
  String get getpApellido => pApellido;

  set setpApellido(String valor){
    pApellido = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE S APELLIDO
  String get getsApellido => sApellido;

  set setsApellido(String valor){
    sApellido = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE ROL
  int get getrol => rol;

  set setrol(int valor){
    rol = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE CODIGO CLIENTE
  String get getcodigoCliente => codigoCliente;

  set setcodigoCliente(String valor){
    codigoCliente = valor;
    notifyListeners();
  }

}