import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/cargo/domain/providers/registrar_form_cargo.dart';

class RadioButton extends StatelessWidget {
    final int index;
    final int value;
    final String title;
    final double width;

  const RadioButton({
    Key? key, 
    required this.index, 
    required this.value, 
    required this.title, 
    required this.width
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final radioListTile = Provider.of<RegisterProvider>(context);

    return SizedBox(
      width: width,

      child: RadioListTile<int>(                    
        title:Text(title, style: const TextStyle(fontSize: 10, color: Colors.orange), maxLines: 1,),
        groupValue: (index==0)? radioListTile.valorTipoCargaDentroPlanta: radioListTile.valorTipoCargaMovimientoDia,
        contentPadding: EdgeInsets.zero,
        onChanged: (value) => (index==0)? radioListTile.valorTipoCargaDentroPlanta=value! : radioListTile.valorTipoCargaMovimientoDia,
        value:value, 
      ),

    );
    
  }
}