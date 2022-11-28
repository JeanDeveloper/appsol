import 'dart:convert';

PersonalModel personalModelFromJson(String str) => PersonalModel.fromJson(json.decode(str));

String personalModelToJson(PersonalModel data) => json.encode(data.toJson());

class PersonalModel {
    PersonalModel({
        this.codigoPersonal,
        this.codigoTipoPersonal,
        this.codigoEmpresa,
        this.codigoTipoDocumento,
        this.codigoCargo,
        this.codigoArea,
        this.nombre1,
        this.nombre2,
        this.apellido1,
        this.apellido2,
        this.docPersonal,
        this.sexo,
        this.esAutorizante,
        this.esListaNegra,
        this.tieneFoto,
        this.imgPath,
        this.brevete,
        this.nombreTurnoPersonal,
        this.fNacimiento,
        this.dosisCompleta,
        this.telefono,
    });

    String? codigoPersonal;
    String? codigoTipoPersonal;
    String? codigoEmpresa;
    String? codigoTipoDocumento;
    String? codigoCargo;
    String? codigoArea;
    String? nombre1;
    String? nombre2;
    String? apellido1;
    String? apellido2;
    String? docPersonal;
    String? sexo;
    bool?   esAutorizante;
    String? esListaNegra;
    String? tieneFoto;
    String? imgPath;
    String? brevete;
    String? nombreTurnoPersonal;
    String? fNacimiento;
    String? dosisCompleta;
    String? telefono;

    factory PersonalModel.fromJson(Map<String, dynamic> json) => PersonalModel(
        codigoPersonal    : json["codigo_personal"],
        codigoTipoPersonal: json["codigo_tipo_personal"],
        codigoEmpresa: json["codigo_empresa"],
        codigoTipoDocumento: json["codigo_tipo_documento"],
        codigoCargo: json["codigo_cargo"],
        codigoArea: json["codigo_area"],
        nombre1: json["nombre1"],
        nombre2: json["nombre2"],
        apellido1: json["apellido1"],
        apellido2: json["apellido2"],
        docPersonal: json["doc_personal"],
        sexo: json["sexo"],
        esAutorizante: json["es_autorizante"],
        esListaNegra: json["es_lista_negra"],
        tieneFoto: json["tiene_foto"],
        imgPath: json["imgPath"],
        brevete: json["brevete"],
        nombreTurnoPersonal: json["nombre_turno_personal"],
        fNacimiento: json["f_nacimiento"],
        dosisCompleta: json["dosis_completa"],
        telefono: json["telefono"],
    );

    Map<String, dynamic> toJson() => {
        "codigo_personal": codigoPersonal,
        "codigo_tipo_personal": codigoTipoPersonal,
        "codigo_empresa": codigoEmpresa,
        "codigo_tipo_documento": codigoTipoDocumento,
        "codigo_cargo": codigoCargo,
        "codigo_area": codigoArea,
        "nombre1": nombre1,
        "nombre2": nombre2,
        "apellido1": apellido1,
        "apellido2": apellido2,
        "doc_personal": docPersonal,
        "sexo": sexo,
        "es_autorizante": esAutorizante,
        "es_lista_negra": esListaNegra,
        "tiene_foto": tieneFoto,
        "imgPath": imgPath,
        "brevete": brevete,
        "nombre_turno_personal": nombreTurnoPersonal,
        "f_nacimiento": fNacimiento,
        "dosis_completa": dosisCompleta,
        "telefono": telefono,
    };

}


PersonalValidacionModel personalValidacionModelFromJson(String str) => PersonalValidacionModel.fromJson(json.decode(str));

class PersonalValidacionModel{

    PersonalValidacionModel({
      this.estadoTransaccion,
      this.codPersonal,
    });

    int? estadoTransaccion;
    String? codPersonal;

    factory PersonalValidacionModel.fromJson(Map<String, dynamic> json) => PersonalValidacionModel(
      estadoTransaccion: json["estado_transaccion"],
      codPersonal: json["cod_personal"],
    );

}










// class PersonalValidacionModel{
//   int documento;
//   String cod_persona;

// }
