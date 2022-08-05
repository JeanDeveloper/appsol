import 'package:flutter/material.dart';

class MovimientosPageProvider extends ChangeNotifier{

  String _search = '';
  
  int _selectedMenuOpt = 0;

  bool _isShearing = false;


  int get getSelectedMenuOpt =>_selectedMenuOpt;
  set setSelectedMenuOpt(int valor){
    _selectedMenuOpt = valor;
    notifyListeners();
  }



  bool get getIsShearing => _isShearing;

  set setIsShearing(bool valor){
    _isShearing = valor;
    notifyListeners();
  }

  String get getSearch => _search;

  set setSearch(String valor){
    _search = valor;
    notifyListeners();
  }






}