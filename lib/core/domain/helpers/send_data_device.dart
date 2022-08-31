import 'package:solgis/core/data/services/device_service.dart';
import 'package:solgis/core/data/services/push_notifications_service.dart';
import 'package:solgis/core/domain/models/device_information_provider.dart';
import 'package:solgis/core/domain/models/device_response_model.dart';

Future<DeviceResponseModel?>senDataDevice(String number)async{
  final device = DeviceInformationModel();
  await device.getInformationDevice();
  final String? token = await PushNotification.initalizedApp();
  final deviceService = DeviceService();
  final deviceResponse = await deviceService.sendDataDevice(device, number, token);
  return deviceResponse;
}

Future<int>checkAuthDevice()async{
  final device = DeviceInformationModel();
  await device.getInformationDevice();
  final deviceService = DeviceService();
  final deviceResponse = await deviceService.checkAuthDevice(device.serialNumber!);
  return deviceResponse;
}
