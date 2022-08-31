
import 'dart:convert';

List<CargoModel> cargoModelFromJson(String str) => List<CargoModel>.from(json.decode(str).map((x) => CargoModel.fromJson(x)));

class CargosModel {

  List<CargoModel> items = [];

  CargosModel();

  CargosModel.fromJsonList( List<dynamic> jsonList ) {
    for ( var item in jsonList ){
      final cargo = CargoModel.fromJson(item);
      items.add(cargo);
    }
  }

}

class CargoModel {
    String? codigo;
    String? cargo;
    String? habilitado;

    CargoModel({
        this.codigo,
        this.cargo,
        this.habilitado,
    });


    CargoModel.fromJson(Map<String, dynamic> json) {
        codigo     = json["codigo"] ?? '';
        cargo      = json["cargo"] ?? '';
        habilitado = json["habilitado"] ?? '';
    }

}
