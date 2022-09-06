import 'package:flutter/material.dart';

class RadioCargoProvider extends ChangeNotifier {

  //controla el radio de tipo de documento
  int _tipoRegistro  = 1;

  //controla el radio de tipo de persona
  int _valorTipoPersonaDentroPlanta = 0;

  //controla el radio de tipo de persona movimiento del dia
  int _valorTipoPersonaMovimientoDia= 0;

  int get tipoRegistro =>_tipoRegistro; 

  set tipoRegistro(int valor){
    _tipoRegistro = valor;
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