import 'package:flutter/material.dart';

class RadioProvider extends ChangeNotifier {

  //controla el radio de tipo de documento
  int _valorTipoDocumento  = 1;

  //controla el radio de tipo de persona
  int _valorTipoPersonaDentroPlanta = 0;

  //controla el radio de tipo de persona movimiento del dia
  int _valorTipoPersonaMovimientoDia= 0;
  
  int get valorTipoDocumento =>_valorTipoDocumento; 

  set valorTipoDocumento(int valor){

    _valorTipoDocumento = valor;

    notifyListeners();
  }

  int get valorTipoPersonaMovimientoDia =>_valorTipoPersonaMovimientoDia; 

  set valorTipoPersonaMovimientoDia(int valor){
    _valorTipoPersonaMovimientoDia = valor;
    notifyListeners();
  }


  int get valorTipoPersonaDentroPlanta =>_valorTipoPersonaDentroPlanta; 

  set valorTipoPersonaDentroPlanta(int valor){
    _valorTipoPersonaDentroPlanta = valor;
    notifyListeners();
}


}