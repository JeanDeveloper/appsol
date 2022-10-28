import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SalidaProvider extends ChangeNotifier {


  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //controla el radio de otro material
  int _otroMaterial  = 1;

  String _guia = '';

  String _materialValor = '';

  XFile?  _fotoGuia;
  XFile?  _fotoMaterialValor; 



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

  // METODOS PARA LA VARIABLE FOTO GUIA
  XFile? get fotoGuia => _fotoGuia;

  set fotoGuia (XFile? value) {
    _fotoGuia = value;
    notifyListeners();
  }


  // METODOS PARA LA VARIABLE FOTO MATERIAL VALOR
  XFile? get fotoMaterialValor => _fotoMaterialValor;

  set fotoMaterialValor ( XFile? value) {
    _fotoMaterialValor = value;
    notifyListeners();
  }


}



