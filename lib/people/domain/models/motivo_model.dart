import 'dart:convert';

List<MotivoDbModel> motivoDbModelFromJson(String str) => List<MotivoDbModel>.from(json.decode(str).map((x) => MotivoDbModel.fromJson(x)));


class MotivosDbModel {

  List<MotivoDbModel> items = [];

  MotivosDbModel.fromJsonList( List<dynamic> jsonList ) {

    for ( var item in jsonList ){

      final cargo = MotivoDbModel.fromJson(item);
      items.add(cargo);
    
    }
  
  }

}

class MotivoDbModel {
  MotivoDbModel({
      this.codigo,
      this.tipo,
  });

  String? codigo;
  String? tipo;

  MotivoDbModel.fromJson(Map<String, dynamic> json) {
    codigo = json["codigo"];
    tipo   = json["tipo"];

  }

}
