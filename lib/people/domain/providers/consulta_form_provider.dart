import 'package:flutter/material.dart';

class ConsultaFormProvider extends ChangeNotifier{

  String _pasaporte = '';
  String _dataBarCode = '';

  bool _isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String get dataBarCode => _dataBarCode;

  set dataBarCode(String value) {
    _dataBarCode = value;
    notifyListeners();
  }

  //METODO PARA LA VARIABLE LOADING
  bool get isLoading => _isLoading;

  set isLoading(value){
    _isLoading = value;
    notifyListeners();
  }

  // METODOS PARA LA VARIABLE pasaporte
  String get pasaporte => _pasaporte;

  set pasaporte (value) {
    _pasaporte = value;
    notifyListeners();
  }

  bool isValidForm(){
    
    print(formKey.currentState?.validate());
    print('$pasaporte');
    return formKey.currentState?.validate() ?? false;
  
  }

}