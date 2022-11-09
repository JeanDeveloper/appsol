import 'dart:convert';

DatosAccesoMModel datosAccesoMModelFromJson(String str) => DatosAccesoMModel.fromJson(json.decode(str));

class DatosAccesoMModel {
    String? codigoDatosAcceso;
    String? codigoMovimiento;
    String? guiaMovimiento;
    String? fotoGuiaMovimiento;
    String? materialMovimiento;
    String? fotoMaterialMovimiento;
    DateTime? fechaCreacion;

    DatosAccesoMModel({
        this.codigoDatosAcceso,
        this.codigoMovimiento,
        this.guiaMovimiento,
        this.fotoGuiaMovimiento,
        this.materialMovimiento,
        this.fotoMaterialMovimiento,
        this.fechaCreacion,
    });

    DatosAccesoMModel.fromJson(Map<String, dynamic> json) {
      codigoDatosAcceso         = json["codigo_datos_acceso"];
      codigoMovimiento          = json["codigo_movimiento"];
      guiaMovimiento            = json["guia_movimiento"] ?? '';
      fotoGuiaMovimiento        = json["foto_guia_movimiento"]?? '';
      materialMovimiento        = json["material_movimiento"]?? '';
      fotoMaterialMovimiento    = json["foto_material_movimiento"]?? '';
      fechaCreacion             = DateTime.parse(json["fecha_creacion"]?? '');
    }


}
