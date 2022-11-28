import 'package:flutter/material.dart';

class HabilitarPersonalProvider extends ChangeNotifier{

  //CONTROLA LA EMPRESA
  int _empresa = -1;

  //controla el cargo.
  int _cargo = -1;

  //controla el tipo de persona
  int _tipoPersona =  1;


  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  //EMPRESA
  int get empresa =>_empresa; 

  set empresa(int valor){
    _empresa = valor;
    notifyListeners();
  }

  //CARGO
  int get cargo =>_cargo; 

  set cargo(int valor){
    _cargo = valor;
    notifyListeners();
  }

  //controla el tipo Persona.
  int get tipoPersona =>_tipoPersona; 

  set tipoPersona (int valor){
    _tipoPersona = valor;
    notifyListeners();
  }



  bool isValidForm(){
    return  formKey.currentState?.validate() ?? false;
  }



}