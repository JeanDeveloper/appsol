import 'dart:convert';

List<MovimientoCargoModel> movimientoCargoModelFromJson(String str) => List<MovimientoCargoModel>.from(json.decode(str).map((x) => MovimientoCargoModel.fromJson(x)));

class MovimientosCargoModel{

  List<MovimientoCargoModel> items = [];
  MovimientosCargoModel();
  MovimientosCargoModel.fromJsonList( List<dynamic> jsonList ) {
    for ( var item in jsonList ){
      final movimientoCargo = MovimientoCargoModel.fromJson(item);
      items.add(movimientoCargo);
    }
  }

}

class MovimientoCargoModel {

  String? codMovimiento;
  String? codigoVehicular;
  String? placa;
  String? tipoCarga;
  String? nombres;
  String? dni;
  String? cargo;
  String? empresa;
  DateTime? fechaIngreso;
  String? fechaSalida;

  MovimientoCargoModel({
      this.codMovimiento,
      this.codigoVehicular,
      this.placa,
      this.tipoCarga,
      this.nombres,
      this.dni,
      this.cargo,
      this.empresa,
      this.fechaIngreso,
      this.fechaSalida,
  });

  MovimientoCargoModel.fromJson(Map<String, dynamic> json) {

      codMovimiento   = json["cod_movimiento"];
      codigoVehicular = json["codigo_vehicular"];
      placa           = json["placa"];
      tipoCarga       = json["tipo_carga"];
      nombres         = json["nombres"];
      dni             = json["dni"];
      cargo           = json["cargo"];
      empresa         = json["empresa"];
      fechaIngreso    = DateTime.parse(json["fecha_ingreso"]);
      fechaSalida     = json["fecha_salida"];

  }

}
