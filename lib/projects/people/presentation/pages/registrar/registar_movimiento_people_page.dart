import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/people/domain/providers/radio_provider.dart';
import 'package:solgis/projects/people/domain/providers/registrar_form_provider.dart';
import 'package:solgis/projects/people/domain/utils/get_result_scanner.dart';
import 'package:solgis/projects/people/presentation/widgets/widgets.dart';


class RegistrarMovimientoPage extends StatelessWidget {

  const RegistrarMovimientoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final registerProvider = Provider.of<RegistrarFormProvider>(context);
    final tipoProvider = Provider.of<RadioProvider>(context);
    final viewBotton  = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      
      body: SizedBox(

        width: size.width,
        height: size.height,

        child: Stack(

          children:  [

            //FONDO
            const HomePageBackGroundPeople(),

            (registerProvider.isLoading)
            ? const Center(child:  CircularProgressIndicator())

            //FORMULARIO DE REGISTRO
            :const RegistrarForm(),
            
            //MENU BOTTOM
            Visibility(

              visible: (viewBotton==0) ? true: false,

              child: Positioned(

                bottom: 0,

                child: FondoMenuPeople(

                padding: EdgeInsets.symmetric(vertical: size.height*0.035 ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      if(tipoProvider.valorTipoDocumento!=3)

                        //SCANNER
                        ButtonMenuPeople(
                          icon: FontAwesomeIcons.barcode,
                          text: 'ESCANEAR', 
                          onpressed:()async{
                            String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                              "#ff6666", 
                              'Cancelar', 
                              false, 
                              ScanMode.BARCODE
                            );
                            // ignore: use_build_context_synchronously
                            getResultScanner(context,barcodeScanRes);
                          },
                        ),

                      if(tipoProvider.valorTipoDocumento!=3)
                        SizedBox(width: size.width*0.1),

                      //INICIO
                      ButtonMenuPeople(
                        icon: FontAwesomeIcons.house,
                        text: 'INICIO', 
                        onpressed:()=> Navigator.pop(context),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );

  }

}