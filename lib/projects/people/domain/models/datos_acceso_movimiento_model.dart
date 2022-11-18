import 'dart:convert';

DatoAccesoMModel datosAccesoMModelFromJson(String str) => DatoAccesoMModel.fromJson(json.decode(str));

class DatosAccesoModel {  
  List<DatoAccesoMModel> items = [];
  DatosAccesoModel();
  DatosAccesoModel.fromJsonList( List<dynamic> jsonList ) {
    for ( var item in jsonList ){
      final datoAcceso = DatoAccesoMModel.fromJson(item);
      items.add(datoAcceso);
    }
  }
}


class DatoAccesoMModel {
    int? codigoDatosAcceso;
    int? codigoMovimiento;
    String? descripcion;
    DateTime? fechaCreacion;
    String? creadoPor;
    int? codTipoDatoAcceso;
    String? pathImage;

    DatoAccesoMModel({
        this.codigoDatosAcceso,
        this.codigoMovimiento,
        this.descripcion,
        this.fechaCreacion,
        this.creadoPor,
        this.pathImage,
    });

    DatoAccesoMModel.fromJson(Map<String, dynamic> json) {
      codigoDatosAcceso         = json["codigo_dato_acceso"];
      codigoMovimiento          = json["codigo_mov_peatonal"];
      descripcion               = json["descripcion"] ?? '';
      fechaCreacion             = DateTime.parse(json["fecha_creacion"]?? '');
      creadoPor                 = json["creado_por"]?? '';
      codTipoDatoAcceso         = json["cod_tipo_dato_acceso"]?? '';
      pathImage                 = json["pathImage"]?? '';
    }
}
