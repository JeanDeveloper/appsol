import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/people/domain/providers/radio_list_consulta_provider.dart';
import 'package:solgis/theme/theme_people.dart';

class TipoCarnetConsulta extends StatelessWidget {
  
  const TipoCarnetConsulta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final tipoProvider = Provider.of<RadioListConsultaProvider>(context);

    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          // radio de dni, por defecto esta encendido
          SizedBox(
            width: size.width*0.25,
            child: RadioListTile<int>(
              
              activeColor: Colors.white,
              contentPadding: const EdgeInsets.all(0),
              value:1, 
              groupValue: tipoProvider.valorTipoDocumento, 
              onChanged: (value){
                tipoProvider.valorTipoDocumento=value! ;
              },
              title: AutoSizeText('DNI', style:AppThemePeople.lighThemePeople.textTheme.headline3),
            ),
          ),

          // radio de extranjeria
          SizedBox(
            width: size.width*0.25,
            child: RadioListTile<int>(
              activeColor: Colors.white,
              contentPadding: const EdgeInsets.all(0),
              value: 2, 
              groupValue: tipoProvider.valorTipoDocumento, 
              onChanged: (value){
                tipoProvider.valorTipoDocumento=value! ;
              },
              title: AutoSizeText('CE', style: AppThemePeople.lighThemePeople.textTheme.headline3),
            ),
          ),

          // radio de pasaporte
          SizedBox(
            width: size.width*0.35,
            child: RadioListTile<int>(
              value: 3, 
              groupValue: tipoProvider.valorTipoDocumento, 
              activeColor: Colors.white,
              contentPadding: const EdgeInsets.all(0),
              title: AutoSizeText('PASAPORTE', style: AppThemePeople.lighThemePeople.textTheme.headline3),
              onChanged: (value){
                tipoProvider.valorTipoDocumento=value!;
              },
            ),
          ),

        ],
      
      ),

    );


  }
}