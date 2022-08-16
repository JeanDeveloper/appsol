import 'dart:convert';

List<DeviceResponseModel> deviceResponseModelFromJson(String str) => List<DeviceResponseModel>.from(json.decode(str).map((x) => DeviceResponseModel.fromJson(x)));

class DeviceResponseModel {

    DeviceResponseModel({
        this.estado,
        this.message,
        this.idDispositivo,
    });

    int? estado;
    String? message;
    int? idDispositivo;


    DeviceResponseModel.fromJson(Map<String, dynamic> json) {

      estado        = json["estado"] ?? '';
      message       = json["message"] ?? '';
      idDispositivo = json["id_dispositivo"] ?? '';

    }

}
