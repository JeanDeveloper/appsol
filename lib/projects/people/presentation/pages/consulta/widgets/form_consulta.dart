import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/people/domain/providers/radio_list_consulta_provider.dart';
import 'package:solgis/projects/people/presentation/pages/consulta/widgets/widgets.dart';

class FormConsulta extends StatelessWidget {

  const FormConsulta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final size = MediaQuery.of(context).size;
    final tipoProvider = Provider.of<RadioListConsultaProvider>(context);

    return Container(

      margin: const EdgeInsets.all(15),
      width: size.width,
      height: size.height,
      alignment: Alignment.center,

      child: SingleChildScrollView(

        keyboardDismissBehavior:  ScrollViewKeyboardDismissBehavior.onDrag,

        child: Column(
        
          children: [
      
            const TipoCarnetConsulta(),
            SizedBox(height: size.height*0.05),
      
            if(tipoProvider.valorTipoDocumento==1)
              const DNIFormConsulta(),
            
            if(tipoProvider.valorTipoDocumento==2)
              const CarnetFormConsulta(),
            
            if(tipoProvider.valorTipoDocumento==3)
              const PasaporteFormConsulta(),
        
          ],
        
        ),
      
      ),

    );


  }
}