import 'dart:convert';

FotoAccesoModel fotoAccesoModelFromJson(String str) => FotoAccesoModel.fromJson(json.decode(str));

class FotoAccesoModel {

  
    String? fotoId;
    String? nombre;
    String? xtension;
    int? tipoDatoAcceso;
    int? tamanio;
    DateTime? fechaCreacion;
    String? creadoPor;
    String? ubicacion;



    FotoAccesoModel({
        this.fotoId,
        this.nombre,
        this.xtension,
        this.tipoDatoAcceso,
        this.tamanio,
        this.fechaCreacion,
        this.creadoPor,
        this.ubicacion,
    });



    FotoAccesoModel.fromJson(Map<String, dynamic> json){

        fotoId          = json["foto_id"];
        nombre          = json["nombre"];
        xtension        = json["extension"];
        tipoDatoAcceso  = json["tipo_dato_acceso"];
        tamanio         = json["tamanio"];
        fechaCreacion   = DateTime.parse(json["fecha_creacion"]);
        creadoPor       = json["creado_por"];
        ubicacion       = json["ubicacion"];


    }


}
