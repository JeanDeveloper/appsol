import 'package:flutter/material.dart';
import 'package:solgis/core/domain/models/permisos_model.dart';

class PermisosProvider extends ChangeNotifier{
  
  // late List<PermisoProvider> permisos;
  late List<PermisoModel> _permisos;

  List<PermisoModel> get permisos => _permisos;

  set permisos( List<PermisoModel> permisosModel ){
    _permisos = permisosModel;
    notifyListeners();
  }

}