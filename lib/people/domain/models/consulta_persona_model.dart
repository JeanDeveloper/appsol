import 'dart:convert';
//     final consultaModel = consultaModelFromJson(jsonString);


String consultaModelToJson(List<ConsultaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConsultaModel {
  
    ConsultaModel({
        required this.resultado,
        this.mensaje,
        this.tipoConsulta,
        this.codigoPersona,
        this.docPersona,
        this.nombresPersona,
        this.codigoCargo,
        this.cargo,
        this.codigoTipoDocumento,
        this.tipoDocumento,
        this.codigoEmpresa,
        this.empresa,
        this.codigoMovSgt,
        this.codigoAutorizante,
        this.autorizante,
        this.codigoMotivo,
        this.motivo,
        this.codigoArea,
        this.area,
        this.codigoTipoPersona,
        this.tipoPersona,
        required this.codigoServicio,
        required this.codigoClienteControl,
        this.img,
        this.nroPase,
    });

    String resultado;
    String? mensaje;
    String? tipoConsulta;
    int? codigoPersona;
    String? docPersona;
    String? nombresPersona;
    int? codigoCargo;
    String? cargo;
    int? codigoTipoDocumento;
    String? tipoDocumento;
    int? codigoEmpresa;
    String? empresa;
    int? codigoMovSgt;
    int? codigoAutorizante;
    String? autorizante;
    int? codigoMotivo;
    String? motivo;
    int? codigoArea;
    String? area;
    int? codigoTipoPersona;
    String? tipoPersona;
    int codigoServicio;
    int codigoClienteControl;
    String? img;
    String? nroPase;

    factory ConsultaModel.fromJson(Map<String, dynamic> json) => ConsultaModel(
        resultado: json["resultado"],
        mensaje: json["mensaje"],
        tipoConsulta: json["tipo_consulta"],
        codigoPersona: json["codigo_persona"],
        docPersona: json["doc_persona"],
        nombresPersona: json["nombres_persona"],
        codigoCargo: json["codigo_cargo"],
        cargo: json["cargo"],
        codigoTipoDocumento: json["codigo_tipo_documento"],
        tipoDocumento: json["tipo_documento"],
        codigoEmpresa: json["codigo_empresa"],
        empresa: json["empresa"],
        codigoMovSgt: json["codigo_mov_sgt"],
        codigoAutorizante: json["codigo_autorizante"],
        autorizante: json["autorizante"],
        codigoMotivo: json["codigo_motivo"],
        motivo: json["motivo"],
        codigoArea: json["codigo_area"],
        area: json["area"],
        codigoTipoPersona: json["codigo_tipo_persona"],
        tipoPersona: json["tipo_persona"],
        codigoServicio: json["codigo_servicio"],
        codigoClienteControl: json["codigo_cliente_control"],
        img: json["img"],
        nroPase: json["nro_pase"],
    );

    Map<String, dynamic> toJson() => {
        "resultado": resultado,
        "mensaje": mensaje,
        "tipo_consulta": tipoConsulta,
        "codigo_persona": codigoPersona,
        "doc_persona": docPersona,
        "nombres_persona": nombresPersona,
        "codigo_cargo": codigoCargo,
        "cargo": cargo,
        "codigo_tipo_documento": codigoTipoDocumento,
        "tipo_documento": tipoDocumento,
        "codigo_empresa": codigoEmpresa,
        "empresa": empresa,
        "codigo_mov_sgt": codigoMovSgt,
        "codigo_autorizante": codigoAutorizante,
        "autorizante": autorizante,
        "codigo_motivo": codigoMotivo,
        "motivo": motivo,
        "codigo_area": codigoArea,
        "area": area,
        "codigo_tipo_persona": codigoTipoPersona,
        "tipo_persona": tipoPersona,
        "codigo_servicio": codigoServicio,
        "codigo_cliente_control": codigoClienteControl,
        "img": img,
        "nro_pase": nroPase,
    };

}
