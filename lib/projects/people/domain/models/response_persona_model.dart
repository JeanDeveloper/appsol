// To parse this JSON data, do
//
//     final responsePersonalModel = responsePersonalModelFromJson(jsonString);

import 'dart:convert';

List<ResponsePersonalModel> responsePersonalModelFromJson(String str) => List<ResponsePersonalModel>.from(json.decode(str).map((x) => ResponsePersonalModel.fromJson(x)));


class ResponsePersonalModel{

    String? message;
    int? personal_maestro;

    ResponsePersonalModel({
        this.message,
        this.personal_maestro,

    });


    ResponsePersonalModel.fromJson(Map<String, dynamic> json){
        message = json["message"] ?? '';
        personal_maestro = json["personal_maestro"];
    }


}
