import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/helpers/send_data_device.dart';
import 'package:solgis/core/domain/providers/auth_device_provider.dart';
import 'package:solgis/core/presentation/pages/pages.dart';
import 'package:solgis/core/presentation/widgets/widgets.dart';

class InitializedWidget extends StatefulWidget{

  const InitializedWidget({Key? key}) : super(key: key);

  @override
  State<InitializedWidget> createState() => _InitializedWidgetState();

}

class _InitializedWidgetState extends State<InitializedWidget> with WidgetsBindingObserver {
  
  late int _estado;
  late Timer timerSlide;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _estado = -1;

    checkAuthDevice()
    .then((value) {
      _estado = value;
      setState(() {
      });
    });

    super.initState();

  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    if(state == AppLifecycleState.resumed){
      checkAuthDevice()
      .then((value) {
        _estado = value;
        setState(() {
        });
      });
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    //print('se llamo al dispose');
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { 

    final loginDeviceProvider = Provider.of<AuthDeviceProvider>(context); //sacado el listen

    if( _estado == -1) loginDeviceProvider.status = AuthDeviceStatus.Authenticanting; //CARGANDO
    if( _estado == 0 ) loginDeviceProvider.status = AuthDeviceStatus.Uninitialized;   //PRIMERA VEZ
    if( _estado == 1 ) loginDeviceProvider.status = AuthDeviceStatus.Aproved;         //APROBADO
    if( _estado == 2 ) loginDeviceProvider.status = AuthDeviceStatus.Pending;         //PENDIENTE
    if( _estado == 3 ) loginDeviceProvider.status = AuthDeviceStatus.Refused;         //RECHAZADO
    if( _estado == 4 ) loginDeviceProvider.status = AuthDeviceStatus.Pending;         //ELIMINADO
    if( _estado == 5 ) loginDeviceProvider.status = AuthDeviceStatus.Pending;         //ELIMINADO

    switch(loginDeviceProvider.status){

      case AuthDeviceStatus.Uninitialized:
        return const PhonePage();

      case AuthDeviceStatus.Authenticanting:
        return const LoadingPage();

      case AuthDeviceStatus.Pending:
        return const PendingPage();

      case AuthDeviceStatus.Aproved:
        return const InitializedWidgetAuth();

      case AuthDeviceStatus.Refused:
        return const RefusedPage(); //MANDAR UN PARAMETRO QUE ESTA RECHAZADO

    }

  }

}

    //TAREA CRONOMETRADA CADA 5 SEGUNDOS PENDIENTE POR MEJORAR 
    // SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    //   timerSlide = Timer.periodic(const Duration(seconds: 5), (Timer timer) async {
    //     checkAuthDevice()
    //       .then((value) {
    //         _estado =value;
    //         setState(() {});
    //       });
    //   });
    // });