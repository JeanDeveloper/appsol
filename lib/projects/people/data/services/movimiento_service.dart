import  'package:http_parser/http_parser.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/person_auth_provider.dart';
import 'package:solgis/projects/people/data/services/foto_acceso_service.dart';
import 'package:solgis/projects/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/projects/people/domain/models/datos_acceso_movimiento_model.dart';
import 'package:solgis/projects/people/domain/models/movimiento_model.dart';

class MovimientosProvider extends ChangeNotifier{
  
  final String _url   = '190.116.178.163:96';
  final String _uncodePath = 'appsol/people/movimientos/';
  final bool cargando = false;
  File? pictureFile;
  List<MovimientoModel> movimientosTotalesSelected = [];
  String tipoSeleccionado = 'todos';
  int movimientosContador = 0;

  int get getmovimientosContador => movimientosContador;

  //PETICION GET
  Future<List<MovimientoModel>> _procesarRespuestaGet(Uri url) async {

    final resp = await http.get( 
      url, 
      headers:  {
        HttpHeaders.contentTypeHeader: "application/json;  charset=utf-8"
      }
    );

    final decodedData = json.decode(utf8.decode(resp.bodyBytes));
    final movimientos = MovimientosModel.fromJsonList(decodedData);
    
    return movimientos.items;

  }

  //PETICION POST
  Future<int> _procesarRespuestaPost(BuildContext context, Uri url, ConsultaModel consulta, DatosAccesoMModel datos) async{

    final loginProvider = Provider.of<PersonAuthProvider>(context, listen: false);
 
    final resp = await http.post(
      url,

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

      body: jsonEncode(
        <String, String>{
          'codigo_personal'       : '${consulta.codigoPersona}',
          'codigo_servicio'       : '${consulta.codigoServicio}',
          'codigo_tipo_movimiento': '${consulta.codigoMovSgt}',
          'codigo_tipo_motivo'    : '${consulta.codigoMotivo}',       //DINAMICO NO ESTATICO
          'codigo_empresa'        : '${consulta.codigoEmpresa}',      
          'autorizado_por'        : '${consulta.codigoAutorizante}',  //DINAMICO Y NO ESTATICO
          'creado_por'            : 'PEOPLE_${loginProvider.dni}',    
          'codigo_area'           : '${consulta.codigoArea}',         //DINAMICO Y NO ESTATICO
          'tipo_persona'          : '${consulta.tipoPersona}',
          'guia'                  : datos.guiaMovimiento ?? '', 
          'url_foto_guia'         : '',
          'material'              : datos.materialMovimiento ?? '',
          'url_foto_material'     : '',
        }
      ),

    );

    if( resp.statusCode == 201 ) return 1;

    return -1;

  }

  //OBTENER DE MOVIMIENTOS
  Future<List<MovimientoModel>> getMovimientos( String idServicio,  String tipoMovimiento, {String tipoPersonal= "0"}) async {
    final url = Uri.http( _url, _uncodePath,{
      'tipoMovimiento': tipoMovimiento,
      'idServicio': idServicio,
      'tipoPersonal': tipoPersonal,
    });
    final movimientos = await _procesarRespuestaGet(url);
    movimientosContador = movimientos.length;
    notifyListeners();
    if(tipoPersonal== '0') movimientosTotalesSelected = [...movimientos];
    return movimientos;
  }

  //OBTENER DE MOVIMIENTOS LUEGO DE CARGAR
  Future<List<MovimientoModel>> loadDataMovimientos( String idServicio,  String tipoMovimiento, {String tipoPersonal= "0"}) async {
    final url = Uri.http( _url, _uncodePath, {
      'tipoMovimiento': tipoMovimiento,
      'idServicio': idServicio,
      'tipoPersonal': tipoPersonal,
    } );
    final movimientos = await _procesarRespuestaGet(url);
    movimientosContador = movimientos.length;
    notifyListeners();
    if(tipoPersonal== '0') movimientosTotalesSelected = [...movimientos];
    return movimientos;
  }

  //CONSULTAR UN MOVIMIENTO
  Future<List<MovimientoModel>> getSearchMovimientos(String query)async{

    final List<MovimientoModel> movimientosFiltered = [];

    for( int i= 0; i< movimientosTotalesSelected.length; i++ ) {

      if (movimientosTotalesSelected[i].dni!.contains(query) || movimientosTotalesSelected[i].nombres!.contains(query.toUpperCase())){
        movimientosFiltered.add(movimientosTotalesSelected[i]);
      }

      // if( movimientosTotalesSelected[i].dni!.contains(query)) movimientosFiltered.add(movimientosTotalesSelected[i]);

    }
    return movimientosFiltered;
  }

  //REGISTRAR UN MOVIMIENTO
  Future<int> registerMovimiento(BuildContext context, ConsultaModel consulta, DatosAccesoMModel datos)async{
    final url = Uri.http(_url, _uncodePath);
    final movimientoId = await _procesarRespuestaPost(context, url, consulta, datos);
    return movimientoId;
  }

  //SUBIR LAS IMAGENES AL SERVIDOR DE SOLMAR CON EL API APISOLGISFOTOS.
  Future<int> obtenerCodigoUltimoMovimiento(String codServicio, String codPersonal ) async {
    final url = Uri.http( _url,'appsol/people/movimientos/obtener_ultimo_movimiento/', {
      'codServicio': codServicio ,
      'codPersonal': codPersonal ,
    });
    final resp = await http.get( 
      url, 
      headers:  {HttpHeaders.contentTypeHeader: "application/json;  charset=utf-8"}
    );
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));
    return decodedData['codigo_movimiento'];
  }

  Future uploadImage( String pathImage, String creadoPor, int datosAcceso, String codigoServicio, String codPersonal,{isCosco = false})async{

    final codigoMovimiento = await obtenerCodigoUltimoMovimiento(codigoServicio, codPersonal);

    print('path de la imagen fotografiada $pathImage');

    if(!isCosco){
      pictureFile = File.fromUri(Uri(path: pathImage));
      pictureFile = await changeFileNameOnly(pictureFile!, '${codigoMovimiento.toString()}.jpg');
      print('imprimiendo del pictureFile');
      print(pictureFile!.path);

      if(pictureFile == null) return null;

      final url = Uri.parse('http://190.116.178.163:92/api/photo/upload-photo');
      final imageUploadRequest = http.MultipartRequest('POST', url);

      final file = await http.MultipartFile.fromPath(
        'file', 
        pictureFile!.path,
        contentType: MediaType('image', 'jpg')
      );

      imageUploadRequest.fields['creado_por'] = creadoPor;
      imageUploadRequest.fields['datoAcceso'] = datosAcceso.toString();
      imageUploadRequest.fields['cod_movimiento'] = codigoMovimiento.toString();
      imageUploadRequest.files.add(file);
      final streamResponse = await imageUploadRequest.send();
      final resp = await http.Response.fromStream(streamResponse);

    }else{

      await FotoAccesoService.updateFotoAcceso(codigoMovimiento.toString(), codPersonal, datosAcceso.toString());

    }

  }

  Future<File> changeFileNameOnly(File file, String newFileName) {
    var path = file.path;
    var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    var newPath = path.substring(0, lastSeparator + 1) + newFileName;
    return file.rename(newPath);
  }

}
