import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/people/data/services/movimiento_service.dart';
import 'package:solgis/projects/people/domain/providers/radio_list_provider.dart';
import 'package:solgis/projects/people/presentation/pages/movimientos/widgets/widgets.dart';
import 'package:solgis/projects/people/presentation/widgets/movimientos_tiles.dart';

class MovimientosDiaTabPage extends StatelessWidget {
  final int index;
  const MovimientosDiaTabPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //van a venir valores

    
    return Column(
      
      children: [

        //se controlará dependiendo el tipo. mandara a llamar cuantos personal hay por tipo
        MovimientosListButton(index:index),

        const Expanded(

          child: MovimientosTilesDiaBody(),

        )

      ],

    );
    
  }

}


class MovimientosTilesDiaBody extends StatelessWidget {

  const MovimientosTilesDiaBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final radioListTile  = Provider.of<RadioListProvider>(context);
    final currentIndex   = radioListTile.valorTipoPersonaMovimientoDia;
    final movimientosListProvider = Provider.of<MovimientosProvider>(context, listen: false);
    final globalProvider = Provider.of<GlobalProvider>(context);

    switch (currentIndex) {

      case 0:
        return MovimientosTiles(movimientos: movimientosListProvider.getMovimientos(globalProvider.codServicio,'2'));

      case 1:
        return MovimientosTiles(movimientos:movimientosListProvider.getMovimientos(globalProvider.codServicio, '2', tipoPersonal: '1'));

      case 2:
        return MovimientosTiles(movimientos: movimientosListProvider.getMovimientos(globalProvider.codServicio,'2', tipoPersonal: '2'));

      case 3:
        return MovimientosTiles(movimientos: movimientosListProvider.getMovimientos(globalProvider.codServicio,'2', tipoPersonal: '3'));

      case 4:
        return MovimientosTiles(movimientos: movimientosListProvider.getMovimientos(globalProvider.codServicio,'2', tipoPersonal: '4'));

      case 5:
        return MovimientosTiles(movimientos: movimientosListProvider.getMovimientos(globalProvider.codServicio,'2', tipoPersonal: '5'));
        
      case 6:
        return MovimientosTiles(movimientos: movimientosListProvider.getMovimientos(globalProvider.codServicio,'2', tipoPersonal: '6'));

      case 7:
        return MovimientosTiles(movimientos: movimientosListProvider.getMovimientos(globalProvider.codServicio,'2', tipoPersonal: '7'));
      
      default:
        return MovimientosTiles(movimientos: movimientosListProvider.getMovimientos(globalProvider.codServicio,'2'));

    }

  }

}