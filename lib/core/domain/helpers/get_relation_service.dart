import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/data/services/dispositivo_servicio_service.dart';
import 'package:solgis/core/domain/models/device_information_provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';

Future<void>getRelation(BuildContext context)async{
  final provider = Provider.of<GlobalProvider>(context, listen:false);

  final device = DeviceInformationModel();
  await device.getInformationDevice();
  final relationService = RelationDeviceService();
  final relation = await relationService.getRelation(device.serialNumber!);
  provider.codDispositivo = relation.codigoDispositivo!;
  provider.codServicio = relation.codigoServicio.toString();
  provider.codCliente = relation.codigoCliente!;
  provider.codSubArea = relation.codigoSubArea!;
  provider.nombreArea = relation.nombreArea!;
  provider.nombreSubArea = relation.nombreSubArea!;
  provider.nombreSucursal = relation.nombreSucursal!;
  provider.nombreCliente = relation.nombreCliente!;
  provider.aliasSede = relation.aliasSede;
  provider.codTipoServicio = relation.codigoTipoServicio!;

}