import 'dart:convert';
List<MotivoDbModel> motivoDbModelFromJson(String str) => List<MotivoDbModel>.from(json.decode(str).map((x) => MotivoDbModel.fromJson(x)));

class MotivosDbModel {
  List<MotivoDbModel> items = [];
  MotivosDbModel.fromJsonList( List<dynamic> jsonList ) {
    for ( var item in jsonList ){
      final motivo = MotivoDbModel.fromJson(item);
      items.add(motivo);
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
