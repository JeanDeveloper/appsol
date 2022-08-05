import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_device_identifier/flutter_device_identifier.dart';
import 'package:solgis/home/domain/models/device_information_model.dart';


class DeviceInformationProvider extends ChangeNotifier{
  
  
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  InformationDeviceModel? deviceModel = InformationDeviceModel(); 
  


  Future<void> getInformationDevice() async {

    // deviceModel = _readAndroidBuildData( await deviceInfoPlugin.androidInfo, await FlutterDeviceIdentifier.androidID );
    print(deviceModel!.serialNumber);
    notifyListeners();

  }

  InformationDeviceModel? _readAndroidBuildData(AndroidDeviceInfo build, String serialNumber){
    deviceModel!.securityPath  = build.version.securityPatch;
    deviceModel!.sdkInt        = build.version.sdkInt.toString();
    deviceModel!.release       = build.version.release;
    deviceModel!.previewSdkInt = build.version.previewSdkInt.toString();
    deviceModel!.incremental   = build.version.incremental;
    deviceModel!.baseOs        = build.version.baseOS;
    deviceModel!.board         = build.board;
    deviceModel!.bootloader    = build.bootloader;
    deviceModel!.brand         = build.brand;
    deviceModel!.device        = build.device;
    deviceModel!.display       = build.display;
    deviceModel!.fingerprint   = build.fingerprint;
    deviceModel!.hardware      = build.hardware;
    deviceModel!.host          = build.host;
    deviceModel!.id            = build.id;
    deviceModel!.manufacturer  = build.manufacturer;
    deviceModel!.model         = build.model;
    deviceModel!.product       = build.product;
    deviceModel!.support64     = build.supported64BitAbis.first;
    deviceModel!.supported32   = build.supported32BitAbis.first;
    deviceModel!.supportAbis   = build.supportedAbis.first;
    deviceModel!.tags          = build.tags;
    deviceModel!.type          = build.type;
    deviceModel!.serialNumber  = serialNumber;

    return deviceModel;

  }




}