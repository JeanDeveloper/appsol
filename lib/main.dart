import 'package:flutter_device_identifier/flutter_device_identifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solgis/core/app/app.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Appsol());
  await FlutterDeviceIdentifier.requestPermission();
  SystemChrome.setEnabledSystemUIMode( SystemUiMode.manual, overlays: [] );

}