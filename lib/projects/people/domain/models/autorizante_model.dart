import 'dart:convert';
List<AutorizanteDbModel> autorizanteDbModelFromJson(String str) => List<AutorizanteDbModel>.from(json.decode(str).map((x) => AutorizanteDbModel.fromJson(x)));

class AutorizantesDbModel{

  List<AutorizanteDbModel> items = [];
  AutorizantesDbModel();

  AutorizantesDbModel.fromJsonList( List<dynamic> jsonList ) {
    for ( var item in jsonList ){
      final cargo = AutorizanteDbModel.fromJson(item);
      items.add(cargo);
    }
  }

}

class AutorizanteDbModel {
    AutorizanteDbModel({
        this.codigo,
        this.codPersonal,
        this.nombrePersonal,
        this.dniPersonal,
    });

    String? codigo;
    String? codPersonal;
    String? nombrePersonal;
    String? dniPersonal;

    AutorizanteDbModel.fromJson(Map<String, dynamic> json) {
      codigo = json["codigo"];
      codPersonal = json["cod_personal"];
      nombrePersonal = json["nombre_personal"];
      dniPersonal = json["dni_personal"];
    }

}
