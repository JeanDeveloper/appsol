import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyPhone = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  String _usuario  = '';
  String _password = '';
  String _dni = '';
  String _phone = '';
  bool _isLoading = false;
  bool _isdragged = false;

  bool get isdragged => _isdragged;

  set isdragged(bool valor){
    _isdragged = valor;
    notifyListeners();
  }

  String get dni => _dni;

  set dni(String valor){
    _dni = valor;
    notifyListeners();
  }


  bool get isLoading => _isLoading;

  set isLoading(bool valor){
    _isLoading = valor;
    notifyListeners();
  }

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


  String get phone  => _phone;

  set phone (String valor){
    _phone = valor;
    notifyListeners();
  }

  bool isValidForm(){
    // print(formKey.currentState?.validate());
    print('${_usuario} - ${_password}');
    return formKey.currentState?.validate() ?? false;
  }

  bool isValidFormPhone(){
    print('$_phone');
    return formKeyPhone.currentState?.validate() ?? false;
  }


}