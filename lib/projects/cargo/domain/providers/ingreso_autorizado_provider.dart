import 'package:flutter/material.dart';

class IngresoAutorizadoProvider extends ChangeNotifier{

  //controla el step
  int _indexStep = 0;

  //STEP
  int get indexStep => _indexStep;

  set indexStep(int valor){
    _indexStep = valor;
    notifyListeners();
  }

}