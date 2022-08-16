import 'package:flutter/material.dart';
import 'package:solgis/projects/people/data/services/area_service.dart';
import 'package:solgis/projects/people/domain/models/area_model.dart';

class AreasProvider extends ChangeNotifier{

  AreaService listaArea = AreaService();
  List<AreaDbModel> itemsareas = [];


  Future<void> initAreas(String codServicio, String codCliente)async{
    if(itemsareas.isEmpty){
      itemsareas = await listaArea.getAreas(codServicio, codCliente);
      notifyListeners();
    }

  }


}
