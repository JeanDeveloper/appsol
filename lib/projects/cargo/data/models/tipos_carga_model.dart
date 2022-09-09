import 'dart:convert';
List<TipoCargaModel> tipoCargaModelFromJson(String str) => List<TipoCargaModel>.from(json.decode(str).map((x) => TipoCargaModel.fromJson(x)));

class TiposCargaModel{

  List<TipoCargaModel> items = [];

  TiposCargaModel();

  TiposCargaModel.fromJsonList( List<dynamic> jsonList ){

    for( var item in jsonList ){
      final carga = TipoCargaModel.fromJson(item);
      items.add(carga);
    }

  }
}

class TipoCargaModel {

    TipoCargaModel({
      this.codigoCarga,
      this.carga,
    });

    String? codigoCarga;
    String? carga;

    TipoCargaModel.fromJson(Map<String, dynamic> json){
      codigoCarga = json["codigo_carga"];
      carga       = json["carga"];
    }

}
