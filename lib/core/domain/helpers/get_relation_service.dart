import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/data/services/dispositivo_servicio_service.dart';
import 'package:solgis/core/device/preferences.dart';
import 'package:solgis/core/domain/models/device_information_provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';

Future<void>getRelation(BuildContext context)async{
  
  final provider = Provider.of<GlobalProvider>(context, listen:false);
  final device = DeviceInformationModel();
  await device.getInformationDevice();
  final relationService = RelationDeviceService();
  final relation = await relationService.getRelation(device.serialNumber!);

  //ASIGNACION DE VARIABLES PARA EL SHARED PREFERENCES
  Preferences.codDispositivo  = provider.codDispositivo  = relation.codigoDispositivo!;
  Preferences.codServicio     = provider.codServicio     = relation.codigoServicio.toString();
  Preferences.codCliente      = provider.codCliente      = relation.codigoCliente!;
  Preferences.codSubArea      = provider.codSubArea      = relation.codigoSubArea!;
  Preferences.nombreArea      = provider.nombreArea      = relation.nombreArea!;
  Preferences.nombreSubArea   = provider.nombreSubArea   = relation.nombreSubArea!;
  Preferences.nombreSucursal  = provider.nombreSucursal  = relation.nombreSucursal!;
  Preferences.nombreCliente   = provider.nombreCliente   = relation.nombreCliente!;
  Preferences.aliasSede       = provider.aliasSede       = relation.aliasSede;
  Preferences.codTipoServicio = provider.codTipoServicio = relation.codigoTipoServicio!;
  Preferences.nombrePuesto    = provider.nombrePuesto    = relation.nombrePuesto!;

}