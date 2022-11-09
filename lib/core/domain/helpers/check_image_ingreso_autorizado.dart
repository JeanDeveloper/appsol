import 'package:http/http.dart' as http;

Future<int> checkImageStatus(String? urlimage ) async {

  final uri = Uri.parse(urlimage!);
  final resp = await http.get(uri);

  if(resp.statusCode==200) return 1;
  return -1;

}