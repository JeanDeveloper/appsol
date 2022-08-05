import 'package:flutter/material.dart';


class LoginProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _usuario  = '';
  String _password = '';
  bool isLoading = false;


  String get usuario => _usuario;

  set usuario(String valor){

    _usuario = valor;
    notifyListeners();
    
  }


  String get password => _password;

  set password(String valor){

    _password = valor;
    notifyListeners();

  }



  bool isValidForm(){
    
    print(formKey.currentState?.validate());
    print('${_usuario} - ${_password}');
    return formKey.currentState?.validate() ?? false;

  }




}