import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:solgis/projects/cargo/data/models/movimiento_cargo_model.dart';

class MovimientoCargoService{

  final String _url = '192.168.10.103:8000';
  final String _uncodePath = 'appsol/cargo/movimientos/';
  final bool cargando = false;


  StreamController<int> _movimientosContador = StreamController<int>();
  Stream<int> get movimientosContador => _movimientosContador.stream;
  dispose(){
    _movimientosContador.close();
  }
  


  //OBTENER LOS MOVIMIENTOS.
  Future<List<MovimientoCargoModel>> getMovimientosCargo( String codTipoCarga, String codServicio, String tipoConsulta )async{

    final url = Uri.http( _url, _uncodePath, {
      'codTipoCarga': codTipoCarga,
      'codServicio' : codServicio,
      'tipoConsulta': tipoConsulta,
    });

    final response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"}
    );

    final decodedData = json.decode(utf8.decode(response.bodyBytes));
    final movimientosCargo = MovimientosCargoModel.fromJsonList(decodedData);

    _movimientosContador.add(  movimientosCargo.items.length );

    return movimientosCargo.items;
  }


}


