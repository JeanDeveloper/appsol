import 'dart:convert';

List<TipoPersonalModel> tipoPersonalModelFromJson(String str) => List<TipoPersonalModel>.from(json.decode(str).map((x) => TipoPersonalModel.fromJson(x)));

class TiposPersonalModel {
  List<TipoPersonalModel> items = [];
  TiposPersonalModel.fromJsonList( List<dynamic> jsonList ) {
    for ( var item in jsonList ){
      final tiposPersona = TipoPersonalModel.fromJson(item);
      items.add(tiposPersona);
    }
  }
}

class TipoPersonalModel {
    TipoPersonalModel({
        this.codigo,
        this.persona,
    });
    String? codigo;
    String? persona;
    TipoPersonalModel.fromJson(Map<String, dynamic> json){
      codigo  = json["codigo"];
      persona = json["personal"];
    }
}
