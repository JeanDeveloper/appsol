import 'package:flutter/material.dart';

class DetalleMovimientoProvider extends ChangeNotifier{

  //CONTROLA LA SELECCION MARCADA.
  int _indexCurrent = 1;

  int get indexCurrent => _indexCurrent ;

  set indexCurrent(int index){
    _indexCurrent = index;
    notifyListeners();
  }

}