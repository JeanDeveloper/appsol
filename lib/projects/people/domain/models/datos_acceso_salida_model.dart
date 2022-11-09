import 'dart:convert';

DatosAccesoSalidaModel datosAccesoSalidaModelFromJson(String str) => DatosAccesoSalidaModel.fromJson(json.decode(str));

class DatosAccesoSalidaModel {
    String? codigoMovimiento;
    String? codigoDatosAcceso;
    String? guiaMovimiento;
    String? urlGuiaMovimiento;
    String? materialMovimiento;
    String? urlMaterialMovimiento;

    DatosAccesoSalidaModel({
        this.codigoMovimiento,
        this.codigoDatosAcceso,
        this.guiaMovimiento,
        this.urlGuiaMovimiento,
        this.materialMovimiento,
        this.urlMaterialMovimiento,
    });

    DatosAccesoSalidaModel.fromJson(Map<String, dynamic> json) {
      codigoMovimiento          = json["cod_mov"];
      codigoDatosAcceso         = json["cod_datos_acceso"];
      guiaMovimiento            = json["guia_mov"] ?? '';
      urlGuiaMovimiento         = json["url_guia_mov"]?? '';
      materialMovimiento        = json["material_mov"]?? '';
      urlMaterialMovimiento     = json["url_material_mov"]?? '';
    }

}
