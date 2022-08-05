// To parse this JSON data, do
//
//     final movimientosModel = movimientosModelFromJson(jsonString);

import 'dart:convert';

List<MovimientoModel> movimientosModelFromJson(String str) => List<MovimientoModel>.from(json.decode(str).map((x) => MovimientoModel.fromJson(x)));

// String movimientosModelToJson(List<MovimientosModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class MovimientosModel {

  List<MovimientoModel> items = [];
  
  MovimientosModel();

  MovimientosModel.fromJsonList( List<dynamic> jsonList ) {
    for ( var item in jsonList ){
      final movimiento = MovimientoModel.fromJson(item);
      items.add(movimiento);
    }
  }


}


class MovimientoModel {

    String? codMovimiento;
    String? nombres;
    String? dni;
    String? sexo;
    String? cargo;
    String? empresa;
    DateTime? fechaMovimiento;
    String? fechaSalida;
    String? tipoIngreso;
    String? tipoPersonal;
    String? pathImage;


    MovimientoModel({
        this.codMovimiento,
        this.nombres,
        this.dni,
        this.sexo,
        this.cargo,
        this.empresa,
        this.fechaMovimiento,
        this.fechaSalida,
        this.tipoIngreso,
        this.tipoPersonal,
        this.pathImage,
    });

    MovimientoModel.fromJson(Map<String, dynamic> json) {
        
        codMovimiento= json["cod_movimiento"];
        nombres= json["nombres"] ?? '';
        dni= json["dni"] ?? '';
        sexo= json["sexo"] ?? '';
        cargo= json["cargo"] ?? '';
        empresa= json["empresa"] ?? '';
        fechaMovimiento= DateTime.parse(json["fecha_movimiento"]) ;
        fechaSalida = json["fecha_salida"]?? '' ;
        tipoIngreso= json["tipo_ingreso"] ?? '';
        tipoPersonal = json["tipo_personal"];
        pathImage = json["imagen"] ?? '';
    
    }



}
