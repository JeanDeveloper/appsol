import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/cargo/domain/providers/registrar_form_cargo.dart';
import 'package:solgis/projects/cargo/presentation/pages/registrar/widgets/widgets.dart';
import 'package:solgis/projects/cargo/theme/theme_cargo.dart';

class RegistrarFormCargo extends StatelessWidget {

  const RegistrarFormCargo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final tipoProvider = Provider.of<RegisterProvider>(context);

    return SizedBox.expand(

      child: SingleChildScrollView(

        child: Column(

          children: [

            SizedBox(height: size.height*0.1),

            _TipoRegistro(),
            SizedBox(height: size.height*0.1),

            if(tipoProvider.tipoRegistro==1)
              const PlacaFormRegistro(),

            if(tipoProvider.tipoRegistro==2)
              const PlacaFormRegistro(),

          ],
        ),
      ),
    );
  }

}

class _TipoRegistro extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final tipoProvider = Provider.of<RegisterProvider>(context);

    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          // radio de placa, por defecto esta encendido
          SizedBox(
            width: size.width*0.4,
            child: RadioListTile<int>(
              activeColor: Colors.white,
              contentPadding: const EdgeInsets.all(0),
              value:1, 
              groupValue: tipoProvider.tipoRegistro, 
              onChanged: (value){
                tipoProvider.tipoRegistro=value! ;
              },
              title: AutoSizeText('PLACA', style:AppThemeCargo.lighThemeCargo.textTheme.headline3),
            ),
          ),

          // radio de codigo
          SizedBox(
            width: size.width*0.4,
            child: RadioListTile<int>(
              activeColor: Colors.white,
              contentPadding: const EdgeInsets.all(0),
              value: 2, 
              groupValue: tipoProvider.tipoRegistro, 
              onChanged: (value){
                tipoProvider.tipoRegistro=value! ;
              },
              title: AutoSizeText('CODIGO', style: AppThemeCargo.lighThemeCargo.textTheme.headline3),
            ),
          ),

        ]
      ),
    );
  }

}

