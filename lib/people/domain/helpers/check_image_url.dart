import 'package:http/http.dart' as http;

Future<bool> checkImageUrl(String urlimage)async{

      final uri = Uri.parse(urlimage);
      final resp = await http.get(uri);

      if(resp.statusCode==200){return true;}
      return false;

}
