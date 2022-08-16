import 'package:flutter/material.dart';

class RadioListProvider extends ChangeNotifier {

  //controla el radio de tipo de documento
  int _valorTipoDocumento  = 1;

  //controla el radio de tipo de persona
  int valorTipoPersonaDentroPlanta = 0;

  //controla el radio de tipo de persona movimiento del dia
  int valorTipoPersonaMovimientoDia= 0;
  
  int get getValorTipoDocumento =>_valorTipoDocumento; 

  set setValorTipoDocumento(int valor){
    _valorTipoDocumento = valor;
    notifyListeners();
  }

  int get getValorTipoPersonaMovimientoDia =>valorTipoPersonaMovimientoDia; 

  set setValorTipoPersonaMovimientoDia(int valor){
    valorTipoPersonaMovimientoDia = valor;
    notifyListeners();
  }


  int get getValorTipoPersonaDentroPlanta =>valorTipoPersonaDentroPlanta; 

  set setValorTipoPersonaDentroPlanta(int valor){
    valorTipoPersonaDentroPlanta = valor;
    notifyListeners();
  }


}