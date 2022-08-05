// To parse this JSON data, do
//
//     final movimientoCreateModel = movimientoCreateModelFromMap(jsonString);

import 'dart:convert';

List<MovimientoCreateModel> movimientoCreateModelFromMap(String str) => List<MovimientoCreateModel>.from(json.decode(str).map((x) => MovimientoCreateModel.fromMap(x)));

String movimientoCreateModelToMap(List<MovimientoCreateModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class MovimientoCreateModel {
    MovimientoCreateModel({
        required this.codigoPersonal,
        required this.codigoServicio, //CONSULTAMODEL codigo_servicio
        this.codigoTipoMovimiento, //CONSULTAMODEL 
        this.codigoTipoMotivo, //CONSULTAMODEL 
        this.codigoEmpresa, //CONSULTAMODEL codigo_empresa
        this.codigoTipoCarga, //NO SE QUE ES
        this.esVehicular, //CONSTANTE
        this.autorizadoPor, //codigo_autorizante,
        this.fechaMovimiento, //FECHA DEL DIA
        this.motivo, //SIEMPRE ES NULL
        this.creadoPor, //ESTE SERÁ POR EL LOGEO
        this.fechaCreacion, //FECHA
        this.codigoAreaVisitada, //CONSULTAMODEL codigo_area
        this.codTipoPersonal, //DUDA
    });

    int codigoPersonal;
    int codigoServicio;
    int? codigoTipoMovimiento;
    int? codigoTipoMotivo;
    int? codigoEmpresa;
    int? codigoTipoCarga;
    int? esVehicular;
    int? autorizadoPor;
    DateTime? fechaMovimiento;
    String? motivo;
    String? creadoPor;
    String? fechaCreacion;
    int? codigoAreaVisitada;
    int? codTipoPersonal;

    factory MovimientoCreateModel.fromMap(Map<String, dynamic> json) => MovimientoCreateModel(
        codigoPersonal: json["codigo_personal"],
        codigoServicio: json["codigo_servicio"],
        codigoTipoMovimiento: json["codigo_tipo_movimiento"],
        codigoTipoMotivo: json["codigo_tipo_motivo"],
        codigoEmpresa: json["codigo_empresa"],
        codigoTipoCarga: json["codigo_tipo_carga"],
        esVehicular: json["es_vehicular"],
        autorizadoPor: json["autorizado_por"],
        fechaMovimiento: json["fecha_movimiento"],
        motivo: json["motivo"],
        creadoPor: json["creado_por"],
        fechaCreacion: json["fecha_creacion"],
        codigoAreaVisitada: json["CodigoAreaVisitada"],
        codTipoPersonal: json["cod_tipo_personal"],
    );

    Map<String, dynamic> toMap() => {
        "codigo_personal": codigoPersonal,
        "codigo_servicio": codigoServicio,
        "codigo_tipo_movimiento": codigoTipoMovimiento,
        "codigo_tipo_motivo": codigoTipoMotivo,
        "codigo_empresa": codigoEmpresa,
        "codigo_tipo_carga": codigoTipoCarga,
        "es_vehicular": 0,
        "autorizado_por": autorizadoPor,
        "fecha_movimiento": DateTime.now(),
        "motivo": null,
        "creado_por": 'JC',
        "fecha_creacion": DateTime.now(),
        "CodigoAreaVisitada": codigoAreaVisitada,
        "cod_tipo_personal": codTipoPersonal,
    };
}
