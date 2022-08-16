import 'package:flutter/material.dart';
import 'package:solgis/home/data/services/device_service.dart';
import 'package:solgis/home/domain/models/device_information_provider.dart';

enum AuthDeviceStatus{

  Uninitialized, //CUANDO INICIALIZA LA APP POR PRIMERA VEZ EN UN DISPOSITIVO.


  Authenticanting, //CUANDO ESTA PROCESANDO LA AUTENTICACION


  Pending, //CUANDO SE HA ENVIADO LOS DATOS Y AUN NO HAY APROBACION POR EL PANEL DE CONTROL.


  Aproved, //CUANDO EL DISPOSITIVO HA SIDO APROBADO Y SE LE HA ASIGNADO DATOS DESDE EL PANEL DE CONTROL.


  Refused, //CUANDO EL DISPOSITIVO HA SIDO RECHAZADO DESDE EL PANEL DE CONTROL.



}

class AuthDeviceProvider extends ChangeNotifier{

  //EL ENVIO DE LOS DATOS DEL DISPOSITIVO A LA BASE DE DATOS.

  AuthDeviceStatus status = AuthDeviceStatus.Uninitialized;
  DeviceService deviceService = DeviceService();
  bool isLoading = false;

  changeState(AuthDeviceStatus state){

    status = state;
    print('Estado: ${status}');
    notifyListeners();
  }

  sendData(BuildContext context, DeviceInformationModel dispositivo){

    try {

      //METODO HTTP PARA ENVIAR TODA LA DATA. 

      deviceService.sendDataDevice(dispositivo, '918398611');
    } catch (e) {

      print(e);

    }

  }


}