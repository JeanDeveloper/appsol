import 'package:flutter/material.dart';
import 'package:solgis/projects/people/domain/models/movimiento_model.dart';
import 'package:solgis/projects/people/presentation/widgets/tile_movimiento.dart';

class MovimientosTiles extends StatelessWidget {

  final Future<List<MovimientoModel>> movimientos;  

  const MovimientosTiles({
    Key? key, 
    required this.movimientos, 
  }) : super(key: key);
  

  //IRA LA CONDICION SI VA HACER EL MOVIMIENTO DENTRO DE PLANTA O MOVIMIENTO DEL DIA
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(

      future:movimientos,

      builder: (BuildContext context, AsyncSnapshot<List<MovimientoModel>> snapshot) {

        if(!snapshot.hasData) return const Center(child: CircularProgressIndicator(color: Colors.blue));

        if(snapshot.data!.isEmpty) {
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.hourglass_empty_rounded),
              Text('No hay movimientos', style: TextStyle(color: Colors.black, fontSize: 12))
            ],
          );
        }

        return ListView.separated(
          separatorBuilder: ( _ , int i) => Divider(color: Colors.grey.shade300.withOpacity(0.5), indent: 10, endIndent: 10, height: 0 ),
          itemCount: snapshot.data!.length,
          itemBuilder: (_, i) => ListTileMovimiento( movimiento: snapshot.data![i]),
        );

      },
    );
  }

}
