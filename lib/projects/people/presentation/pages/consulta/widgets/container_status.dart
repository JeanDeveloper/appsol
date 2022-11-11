import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';

class ContainerEstatus extends StatelessWidget {

  const ContainerEstatus({
    Key? key,
    required this.valor,
  }) : super(key: key);

  final String valor;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final loginProvider = Provider.of<GlobalProvider>(context);

    return Container(
      height: size.height*0.05,
      width: size.width*0.5,
      decoration: BoxDecoration(
        color: (valor == '0') ? Colors.greenAccent : Colors.redAccent,
        borderRadius: BorderRadius.circular(50)
      ),
      alignment: Alignment.center,
      child: Text( (valor == '0') 
        ? (loginProvider.codCliente == '25866') 
          ? 'Homologado'
          : (loginProvider.codCliente == '00013')
            ?'Inducido'
            : 'Autorizado'
        :'Sin Autorizacion', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    );

  }
}
