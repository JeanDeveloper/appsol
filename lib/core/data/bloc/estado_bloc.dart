import 'package:flutter/scheduler.dart';
import 'dart:async';

import 'package:solgis/core/data/services/device_service.dart';
import 'package:solgis/core/domain/models/device_information_provider.dart';

class EstadoBloc {

  Stream<int> get getEstado async*{

        final device = DeviceInformationModel();
        await device.getInformationDevice();
        final deviceService = DeviceService();
        final deviceResponse = await deviceService.checkAuthDevice(device.serialNumber!);
        yield deviceResponse;

  }


}