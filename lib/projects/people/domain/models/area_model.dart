import 'dart:convert';

List<AreaDbModel> areaDbModelFromJson(String str) => List<AreaDbModel>.from(json.decode(str).map((x) => AreaDbModel.fromJson(x)));

class AreasDBModel{

  List<AreaDbModel> items = [];

  AreasDBModel();

  AreasDBModel.fromJsonList( List<dynamic> jsonList ) {

    for ( var item in jsonList ){

      final cargo = AreaDbModel.fromJson(item);
      items.add(cargo);
      
    }

  }


}


class AreaDbModel {
  AreaDbModel({
      this.codigo,
      this.area,
  });

  String? codigo;
  String? area;

  AreaDbModel.fromJson(Map<String, dynamic> json) {
    codigo  = json["codigo"];
    area    = json["area"];
  }

}
