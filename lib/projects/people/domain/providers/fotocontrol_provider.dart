import 'package:flutter/material.dart';

class FotoControlProvider extends ChangeNotifier{

  TextEditingController _controller = TextEditingController();


  // METODOS PARA LA VARIABLE LOADING
  TextEditingController get controller => _controller;

  set controller ( TextEditingController value) {
    _controller = value;
    notifyListeners();
  }



}