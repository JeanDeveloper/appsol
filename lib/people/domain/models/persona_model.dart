import 'dart:convert';

List<PersonaModel> personaModelFromMap(String str) => List<PersonaModel>.from(json.decode(str).map((x) => PersonaModel.fromMap(x)));

String personaModelToMap(List<PersonaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class PersonaModel {
    PersonaModel({
        this.tipoPersonal,
        required this.tipoDocumento,
        required this.numeroDocumento,
        this.pNombre,
        this.sNombre,
        this.pApellido,
        this.sApellido,
        this.empresa,
        this.cargo,
        this.sexo,
        this.urlimg,
        this.creadoPor,
        this.esAutorizante,
        this.habilitado = true,
        this.tiene_foto = true,
        this.cod_cliente_control,
    });
    String? tipoPersonal;
    int tipoDocumento;
    String numeroDocumento;
    String? pNombre;
    String? sNombre;
    String? pApellido;
    String? sApellido;
    String? empresa;
    String? cargo;
    String? sexo;
    String? urlimg;
    String? creadoPor;
    int? esAutorizante= 0;
    bool? habilitado = true;
    bool? tiene_foto = true;
    String? cod_cliente_control;


    factory PersonaModel.fromMap(Map<String, dynamic> json) => PersonaModel(
        tipoPersonal: json["tipo_persona"],
        tipoDocumento: json["tipo_documento"],
        numeroDocumento: json["numero_documento"],
        pNombre: json["p_nombre"],
        sNombre: json["s_nombre"],
        pApellido: json["p_apellido"],
        sApellido: json["s_apellido"],
        empresa: json["empresa"],
        cargo: json["cargo"],
        sexo: json["sexo"],
        urlimg: json["urlimg"],
        creadoPor: json["creadoPor"],
        esAutorizante: json["esAutorizante"],
        habilitado: json["habilitado"],
        tiene_foto: json["tiene_foto"],
        cod_cliente_control: json["cod_cliente_control"],

    );

    Map<String, dynamic> toMap() => {
        "tipo_persona": tipoPersonal,
        "tipo_documento": tipoDocumento,
        "numero_documento": numeroDocumento,
        "p_nombre": pNombre,
        "s_nombre": sNombre,
        "p_apellido": pApellido,
        "s_apellido": sApellido,
        "empresa": empresa,
        "cargo": cargo,
        "sexo": sexo,
        "urlimg": urlimg,
        "creadoPor": creadoPor,
        "esAutorizante": esAutorizante,
        "habilitado": habilitado,
        "tiene_foto": tiene_foto,
        "cod_cliente_control": cod_cliente_control,

    };
}
