import 'dart:convert';

List<PermisoModel> permisosModelFromJson(String str) => List<PermisoModel>.from(json.decode(str).map((x) => PermisoModel.fromJson(x)));

class PermisosModel{

  List<PermisoModel> items = [];
  PermisosModel();

  PermisosModel.fromJsonList( List<dynamic> jsonList ){

    for( var item in jsonList ){
      final permiso = PermisoModel.fromJson(item);
      items.add(permiso);
    }

  }

}

class PermisoModel {

    PermisoModel({
        this.codigoRelacion,
        this.codigoAccion,
        this.codigoAlcance,
        this.habilitado,
    });

    String? codigoRelacion;
    int? codigoAccion;
    int? codigoAlcance;
    bool? habilitado;

    PermisoModel.fromJson(Map<String, dynamic> json) {
      codigoRelacion = json["codigo_relacion"];
      codigoAccion   = int.parse(json["codigo_accion"]);
      codigoAlcance  = int.parse(json["codigo_alcance"]);
      habilitado     = json["habilitado"];
    }

}
