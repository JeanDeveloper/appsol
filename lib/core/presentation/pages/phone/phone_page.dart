import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_device_identifier/flutter_device_identifier.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/helpers/send_data_device.dart';
import 'package:solgis/core/domain/providers/auth_device_provider.dart';
import 'package:solgis/core/domain/providers/home_provider.dart';
import 'package:solgis/core/presentation/widgets/widgets.dart';
import 'package:solgis/projects/people/domain/helpers/show_snackbar_awesome.dart';
import 'package:solgis/core/theme/theme.dart';

class PhonePage extends StatelessWidget {
  
  const PhonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppThemeGeneral.lighTheme.backgroundColor,
      body: const _PhonePageBody(),

    );

  }

}

class _PhonePageBody extends StatelessWidget {

  const _PhonePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final homeProvider = Provider.of<HomeProvider>(context);
    final authDeviceProvider = Provider.of<AuthDeviceProvider>(context);

    // deviceProvider.getInformationDevice();

    return SafeArea(

      child: SingleChildScrollView(

        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        
        child: Column(

          children: [
      
            SizedBox(height: size.height*0.065),
            const Text('Bienvenidos a Appsol', ),
            SizedBox(height: size.height*0.065),

            SvgPicture.asset(
              'assets/svgs/phone-page.svg',
              width: size.width*0.8,
              height: size.height*0.5,
            ),

            SizedBox(height: size.height*0.05),

            const Text('Ingrese su numero'),

            SizedBox(height: size.height*0.05),

            Form(

              key: homeProvider.formKeyPhone ,

              autovalidateMode: AutovalidateMode.onUserInteraction,

              child: Padding(

                padding: const EdgeInsets.symmetric(horizontal:15.0),

                child: InputWidget(

                  maxLength: 9,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    return ( !value!.startsWith('9') || value.length<9 )
                      ?'Por favor ingrese un numero de telefono valido'
                      : null;
                  },
                  onchanged: (value)=> homeProvider.phone = value,
                ),

              ),

            ),

            SizedBox(height: size.height*0.03),

            ButtonWidget(

              padding: EdgeInsets.symmetric(horizontal:size.width*0.4, vertical:size.height*0.02),

              onpressed:(homeProvider.isLoading)
                ?null
                :()async {

                  authDeviceProvider.changeState(AuthDeviceStatus.Authenticanting);

                  FocusScope.of(context).unfocus();
                  
                  if(!homeProvider.isValidFormPhone()) return;

                  // final estado = await MyFunction(deviceProvider.deviceModel);

                  bool checkpermision = await FlutterDeviceIdentifier.checkPermission();

                  // ignore: use_build_context_synchronously
                  if(!checkpermision) return showSnackBarAwesome(context, 'Atencion', 'Se requiere permisos para leer informacion del dispositivo  ', ContentType.failure);

                  homeProvider.isLoading = true;

                  await senDataDevice(homeProvider.phone);

                  homeProvider.isLoading = false;

                  authDeviceProvider.changeState(AuthDeviceStatus.Pending);

                  // ignore: use_build_context_synchronously
                  // Navigator.pushReplacementNamed(context, 'pending_page');

                },

              child: (homeProvider.isLoading)
                ? const SizedBox(height:20, width:30, child: CircularProgressIndicator())
                : const Text('Ingresar',style:  TextStyle(color: Colors.white ))

            ),

          ],

        ),

      ),

    );

  }

}