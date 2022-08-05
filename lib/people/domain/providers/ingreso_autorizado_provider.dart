import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class IngresoAutorizadoProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cod_tipo_doc = '';
  String dni = '';
  String cod_persona ='';
  String nombres = '';
  String cod_cargo = '';
  String cod_empresa = '';
  String empresa = '';
  String cargo = ''; 
  int cod_autorizante = 0;
  String _autorizante = ''; 
  int cod_motivo = 0;
  String _motivo = '';
  int cod_area = 0;
  String _area_acceso = '';
  String _guia = '';
  String _material_valor = '';
  late XFile _fotoGuia;
  late XFile _fotoMaterialValor; 
  bool _isLoading = false;

  // METODOS PARA LA VARIABLE LOADING
  bool get isLoading => _isLoading;

  set isLoading ( bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // METODOS PARA LA VARIABLE AUTORIZANTE
  int get codautorizante => cod_autorizante;

  set codautorizante(int value) {
    cod_autorizante = value;
    notifyListeners();
  }

  // METODOS PARA LA VARIABLE AUTORIZANTE
  String get autorizante => _autorizante;

  set autorizante (value) {
    _autorizante = value;
    notifyListeners();
  }



  // METODOS PARA LA VARIABLE MOTIVO
  int get codmotivo => cod_motivo;

  set codmotivo ( int value ) {
    cod_motivo = value;
    notifyListeners();
  }


  // METODOS PARA LA VARIABLE MOTIVO
  String get motivo => _motivo;

  set motivo ( value) {
    _motivo = value;
    notifyListeners();
  }

 // METODOS PARA LA VARIABLE AREA ACCESO
  int get codarea => cod_area;

  set codarea(int value) {
    cod_area = value;
    notifyListeners();
  }


  // METODOS PARA LA VARIABLE AREA ACCESO
  String get area_acceso => _area_acceso;

  set area_acceso ( value) {
    _area_acceso = value;
    notifyListeners();
  }
  // METODOS PARA LA VARIABLE GUIA
  String get guia => _guia;

  set guia ( String value) {
    _guia = value;
    notifyListeners();
  }


  // METODOS PARA LA VARIABLE MATERIAL VALOR
  String get material_valor => _material_valor;

  set material_valor ( String value ) {
    _material_valor = value;
    notifyListeners();
  }


  // METODOS PARA LA VARIABLE FOTO GUIA
  XFile get fotoGuia => _fotoGuia;

  set fotoGuia (XFile value) {
    _fotoGuia = value;
    notifyListeners();
  }


  // METODOS PARA LA VARIABLE FOTO MATERIAL VALOR
  XFile get fotoMaterialValor => _fotoMaterialValor;

  set fotoMaterialValor ( XFile value) {
    _fotoMaterialValor = value;
    notifyListeners();
  }

  bool isValidForm(){
    
    print(formKey.currentState?.validate());
    return formKey.currentState?.validate() ?? false;
  
  }

}