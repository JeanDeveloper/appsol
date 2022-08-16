import 'package:flutter/material.dart';

class NumPadProvider extends ChangeNotifier{

  String _number = '';

  String _dni = '';

  String _carnet = '';

  String get number => _number;

  set number(String valor){

    _number = valor;
    notifyListeners();
  
  }

  String get carnet => _carnet;

  set carnet(String valor){

    _carnet = valor;
    notifyListeners();
  
  }



  String get dni => _dni;

  set dni(String valor){

    _dni = valor;
    notifyListeners();
  
  }


  setValue( String valor, int tamanio ){

    if(number.length<tamanio){
      _number +=valor;
      notifyListeners();
    }

  }

  backspace(String text){

    if(text.isNotEmpty){

      number = text.split('').sublist(0,text.length-1).join('');
      notifyListeners();

    }

  }

  setValueDni( String valor, int tamanio ){

    if(dni.length<tamanio){
      _dni +=valor;
      notifyListeners();
    }

  }

  backspaceDni(String text){

    if(text.isNotEmpty){

      dni = text.split('').sublist(0,text.length-1).join('');
      notifyListeners();

    }

  }

    setValueCarnet( String valor, int tamanio ){

    if(carnet.length<tamanio){
      _carnet +=valor;
      notifyListeners();
    }

  }

  backspaceCarnet(String text){

    if(text.isNotEmpty){

      carnet = text.split('').sublist(0,text.length-1).join('');
      notifyListeners();

    }

  }


}