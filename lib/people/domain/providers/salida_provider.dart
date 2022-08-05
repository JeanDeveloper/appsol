import 'package:flutter/material.dart';

class SalidaProvider extends ChangeNotifier {


  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //controla el radio de otro material
  int _otroMaterial  = 1;


  String _guia = '';

  String _materialValor = '';


  // METODOS PARA LA VARIABLE GUIA
  String get guia => _guia;

  set guia ( String value) {
    _guia = value;
    notifyListeners();
  }



  // METODOS PARA LA VARIABLE MATERIAL VALOR
  String get materialValor => _materialValor;

  set materialValor ( String value ) {
    _materialValor = value;
    notifyListeners();
  }
  

  
  int get otroMaterial =>_otroMaterial; 

  set otroMaterial(int valor){
    _otroMaterial = valor;
    notifyListeners();
  }



  bool isValidForm(){
    
    print(formKey.currentState?.validate());
    return formKey.currentState?.validate() ?? false;
  
  }

}