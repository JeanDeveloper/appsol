import 'package:flutter/material.dart';

class MovimientosTiles extends StatelessWidget {

  final int codigo;

  const MovimientosTiles({
    super.key, 
    required this.codigo
  });

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(


      builder: (context,AsyncSnapshot<int> snapshot){

        if(!snapshot.hasData)return const Text('cargando la data');

        return Center(
          child: Text(snapshot.data.toString()),
        );

      },
    );
  }
}
