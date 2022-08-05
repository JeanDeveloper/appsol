import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/people/domain/providers/radio_list_provider.dart';

class RadioListButton extends StatelessWidget {

  final int index ;
  final int value;
  final String title;
  final double width;

  const RadioListButton({
    
    required this.index, 
    required this.value, 
    required this.title, 
    required this.width
  });
  
  @override
  Widget build(BuildContext context) {
    
    final radioListTile  = Provider.of<RadioListProvider>(context);


    return SizedBox(

      width: width,

      child: RadioListTile<int>(                    

        title:AutoSizeText(title, style: const TextStyle(fontSize: 10, color: Colors.orange), minFontSize: 6,maxFontSize: 12, maxLines: 1,),
        groupValue: (index==0)? radioListTile.getValorTipoPersonaDentroPlanta: radioListTile.getValorTipoPersonaMovimientoDia,
        contentPadding: EdgeInsets.zero,
        onChanged: (value)=>(index==0)?radioListTile.setValorTipoPersonaDentroPlanta=value! : radioListTile.setValorTipoPersonaMovimientoDia=value!,
        value:value, 

      ),

    );
    
  }

}