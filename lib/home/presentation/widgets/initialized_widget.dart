import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/home/domain/helpers/send_data_device.dart';
import 'package:solgis/home/domain/providers/auth_device_provider.dart';
import 'package:solgis/home/presentation/pages/pages.dart';

class InitializedWidget extends StatefulWidget{

  const InitializedWidget({Key? key}) : super(key: key);

  @override
  State<InitializedWidget> createState() => _InitializedWidgetState();

}

class _InitializedWidgetState extends State<InitializedWidget> with WidgetsBindingObserver {
  
  late int _estado;
  late final estadoDevice;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    print('INIT STATE');
    _estado = -1;
    checkAuthDevice()
      .then((value) {
        _estado =value;
        setState(() {});
        print('Estado en el init state: ${_estado}');
      });
    super.initState();

  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state)async{
    print('CHANGE CICLE LIFE');
    print(state);

    if(state == AppLifecycleState.resumed){
      final estadoId = await checkAuthDevice();
      print(estadoId);
      _estado = estadoId;
      setState(() {});
    }

    super.didChangeAppLifecycleState(state);

  }

  @override
  Widget build(BuildContext context) { 

    final loginDeviceProvider = Provider.of<AuthDeviceProvider>(context);
    print('Estado: ${loginDeviceProvider.status}');
    print(_estado);

      if(_estado ==-1) loginDeviceProvider.status = AuthDeviceStatus.Authenticanting;//CARGANDO
      if(_estado == 0) loginDeviceProvider.status = AuthDeviceStatus.Uninitialized;//PRIMERA VEZ
      if(_estado == 1) loginDeviceProvider.status = AuthDeviceStatus.Aproved;//APROBADO
      if(_estado == 2) loginDeviceProvider.status = AuthDeviceStatus.Pending;//PENDIENTE
      if(_estado == 3) loginDeviceProvider.status = AuthDeviceStatus.Refused;//RECHAZADO

    switch(loginDeviceProvider.status){

      case AuthDeviceStatus.Uninitialized:
        return const PhonePage();

      case AuthDeviceStatus.Authenticanting:
        return const LoadingPage();

      case AuthDeviceStatus.Pending:
        return const PendingPage();

      case AuthDeviceStatus.Aproved:
        return LoginPage();

      case AuthDeviceStatus.Refused:
        return const RefusedPage(); //MANDAR UN PARAMETRO QUE ESTA RECHAZADO

    }

  }
}