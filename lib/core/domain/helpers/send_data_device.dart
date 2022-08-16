
import 'package:solgis/core/data/services/device_service.dart';
import 'package:solgis/core/domain/models/device_information_provider.dart';
import 'package:solgis/core/domain/models/device_response_model.dart';

Future<DeviceResponseModel?>senDataDevice(String number)async{
  
  final device = DeviceInformationModel();
  await device.getInformationDevice();

  final deviceService = DeviceService();

  final deviceResponse = await deviceService.sendDataDevice(device, number);

  return deviceResponse;

}

Future<int>checkAuthDevice()async{

  final device = DeviceInformationModel();
  await device.getInformationDevice();
  final deviceService = DeviceService();
  final deviceResponse = await deviceService.checkAuthDevice(device.serialNumber!);
  return deviceResponse;

}