import 'package:solgis/home/domain/models/app_model.dart';

List<AppModel>getApps() {

  final  List<Map<String, String>> apps = [

    {
        "nombre"    : "People",
        "image_url" : "assets/svgs/people.svg",
        "version"   : "1.0",
        "home_url"  : "home_people" 
    },

    {
        "nombre"    : "Cargo",
        "image_url" : "assets/svgs/cargo.svg",
        "version"   : "1.0",
        "home_url"  : "home_cargo" 
    }

  ];

  AppsModel aplicativos = AppsModel.fromJsonList(apps);

  return aplicativos.items;

}