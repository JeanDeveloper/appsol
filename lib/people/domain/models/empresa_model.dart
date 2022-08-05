// To parse this JSON data, do
//
//     final empresasListModel = empresasListModelFromJson(jsonString);

import 'dart:convert';

List<EmpresaModel> empresasListModelFromJson(String str) => List<EmpresaModel>.from(json.decode(str).map((x) => EmpresaModel.fromJson(x)));


class EmpresasModel {

  List<EmpresaModel> items = [];
  
  EmpresasModel();

  EmpresasModel.fromJsonList( List<dynamic> jsonList ) {
    for ( var item in jsonList ){
      final empresa = EmpresaModel.fromJson(item);
      items.add(empresa);
    }
  }


}


class EmpresaModel {

    String? codigo;
    String? empresa;

    EmpresaModel({
        required this.codigo,
        this.empresa,
    });

    EmpresaModel.fromJson(Map<String, dynamic> json) {

      codigo  = json["codigo"]  ?? '';
      empresa = json["empresa"] ?? '';

    }


}
