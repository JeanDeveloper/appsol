import 'dart:convert';

List<RelationDeviceServiceModel> relationDeviceServiceModelFromJson(String str) => List<RelationDeviceServiceModel>.from(json.decode(str).map((x) => RelationDeviceServiceModel.fromJson(x)));

class RelationDeviceServiceModel {
    RelationDeviceServiceModel({
        this.codigoDispositivo,
        this.codigoServicio,
        this.codigoCliente,
        this.codigoSubArea,
        this.nombreArea,
        this.nombreSubArea,
        this.nombreSucursal,
        this.nombreCliente,
        this.aliasSede,
        this.codigoTipoServicio,
    });

    int?    codigoDispositivo;
    int?    codigoServicio;
    String? codigoCliente;
    int?    codigoSubArea;
    String? nombreArea;
    String? nombreSubArea;
    String? nombreSucursal;
    String? nombreCliente;
    dynamic aliasSede;
    int?    codigoTipoServicio;

    RelationDeviceServiceModel.fromJson(Map<String, dynamic> json) {

      codigoDispositivo  = json["codigo_dispositivo"];
      codigoServicio     = json["codigo_servicio"];
      codigoCliente      = json["codigo_cliente"];
      codigoSubArea      = json["codigo_sub_area"];
      nombreArea         = json["nombre_area"];
      nombreSubArea      = json["nombre_sub_area"];
      nombreSucursal     = json["nombre_sucursal"];
      nombreCliente      = json["nombre_cliente"];
      aliasSede          = json["alias_sede"];
      codigoTipoServicio = json["codigo_tipo_servicio"];

    }

}
