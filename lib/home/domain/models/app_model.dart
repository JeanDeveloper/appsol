import 'dart:convert';

List<AppModel> appModelFromJson(String str) => List<AppModel>.from(json.decode(str).map((x) => AppModel.fromJson(x)));


class AppsModel{

  List<AppModel> items = [];

  AppsModel();

  AppsModel.fromJsonList( List<dynamic> jsonList ) {

    for ( var item in jsonList ){
      
      final cargo = AppModel.fromJson(item);
      items.add(cargo);
      
    }

  }
}

class AppModel {

    AppModel({
        this.nombre,
        this.imageUrl,
        this.version,
        this.url,

    });

    String? nombre;
    String? imageUrl;
    String? version;
    String? url;

    AppModel.fromJson(Map<String, dynamic> json) {
      nombre   = json["nombre"];
      imageUrl = json["image_url"];
      version  = json["version"];
      url      = json["home_url"];
    }

}
