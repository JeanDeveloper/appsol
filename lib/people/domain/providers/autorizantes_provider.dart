import 'package:flutter/material.dart';
import 'package:solgis/people/data/services/autorizante_service.dart';
import 'package:solgis/people/domain/models/autorizante_model.dart';

class AutorizanteProvider extends ChangeNotifier{

  AutorizanteService listaAutorizante = AutorizanteService();

  List<AutorizanteDbModel> itemsAutorizante = [];

  Future<void> initAutorizantes(String codServicio, String tipoPersonal)async{
    if(itemsAutorizante.isEmpty){
      itemsAutorizante = await listaAutorizante.getAutorizantes(codServicio, tipoPersonal); 
      notifyListeners();
    }

  }

}
