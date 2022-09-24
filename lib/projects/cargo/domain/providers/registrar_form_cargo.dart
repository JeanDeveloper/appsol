import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {

  //controla el radio de tipo de registro
  int _tipoRegistro  = 1;

  //controla el radio de tipo de carga
  int _valorTipoCargaDentroPlanta = 0;

  //controla el radio de tipo de carga movimiento del dia
  int _valorTipoCargaMovimientoDia= 0;

  //controla el valor de la placa
  String _placa = '';

  //controla el form del  registrar por placa
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String get placa => _placa;

  set placa(String valor){
    _placa = valor;
    notifyListeners();
  }

  int get tipoRegistro =>_tipoRegistro; 

  set tipoRegistro(int valor){
    _tipoRegistro = valor;
    notifyListeners();
  }

  int get valorTipoCargaMovimientoDia =>_valorTipoCargaMovimientoDia; 

  set valorTipoCargaMovimientoDia(int valor){
    _valorTipoCargaMovimientoDia = valor;
    notifyListeners();
  }

  int get valorTipoCargaDentroPlanta =>_valorTipoCargaDentroPlanta; 

  set valorTipoCargaDentroPlanta(int valor){
    _valorTipoCargaDentroPlanta = valor;
    notifyListeners();
}

  bool isValidForm(){
    print(formKey.currentState?.validate());
    print('$placa');
    return formKey.currentState?.validate() ?? false;
  }



}