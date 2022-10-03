import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_device_identifier/flutter_device_identifier.dart';

class DeviceInformationModel{

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  DeviceInformationModel({

    this.securityPath,
    this.sdkInt,
    this.release,
    this.previewSdkInt,
    this.incremental,
    this.codeName,
    this.baseOs,
    this.board,
    this.bootloader,
    this.brand,
    this.device,
    this.display,
    this.fingerprint,
    this.hardware,
    this.host,
    this.id,
    this.manufacturer,
    this.model,
    this.product,
    this.supported32,
    this.support64,
    this.supportAbis,
    this.tags,
    this.type,
    this.isPhysicalDevice,
    this.serialNumber,

  });

    String? securityPath;
    String? sdkInt;
    String? release;
    String? previewSdkInt;
    String? incremental;
    String? codeName;
    String? baseOs;
    String? board;
    String? bootloader;
    String? brand;
    String? device;
    String? display;
    String? fingerprint;
    String? hardware;
    String? host;
    String? id;
    String? manufacturer;
    String? model;
    String? product;
    String? supported32;
    String? support64;
    String? supportAbis;
    String? tags;
    String? type;
    String? isPhysicalDevice;
    String? serialNumber;

  //PETICION GET
  Future getInformationDevice() async {

    AndroidDeviceInfo build = await deviceInfoPlugin.androidInfo;
    String serial     = await FlutterDeviceIdentifier.androidID;
    
    securityPath  = build.version.securityPatch;
    sdkInt        = build.version.sdkInt.toString();
    release       = build.version.release;
    previewSdkInt = build.version.previewSdkInt.toString();
    incremental   = build.version.incremental;
    baseOs        = build.version.baseOS;
    board         = build.board;
    bootloader    = build.bootloader;
    brand         = build.brand;
    device        = build.device;
    display       = build.display;
    fingerprint   = build.fingerprint;
    hardware      = build.hardware;
    host          = build.host;
    id            = build.id;
    manufacturer  = build.manufacturer;
    model         = build.model;
    product       = build.product;
    support64     = (build.supported64BitAbis.isEmpty) ? ''  : build.supported64BitAbis.first ;
    supported32   = (build.supported32BitAbis.isEmpty) ? ''  : build.supported32BitAbis.first ;
    supportAbis   = (build.supported32BitAbis.isEmpty) ? ''  : build.supportedAbis.first;
    tags          = build.tags;
    type          = build.type;
    serialNumber  = serial;

  }

}