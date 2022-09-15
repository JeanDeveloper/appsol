import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/cargo/data/services/movimiento_cargo_service.dart';
import 'package:solgis/projects/cargo/presentation/pages/movimientos/widgets/widgets.dart';
import 'package:solgis/projects/cargo/presentation/widgets/widgets.dart';

class MovimientoPlantaTab extends StatelessWidget {

  final int index;
  const MovimientoPlantaTab({
    super.key, 
    required this.index
  });

  @override
  Widget build(BuildContext context) {

    // final mProvider = Provider.of<MovimientosPageProvider>(context);

    return Column(

      children:[
        //FILTRO POR TIPO DE CARGA.
        MovimientosHeader( index:index ),
        
        const Expanded(
          child: MovimientosTilesDia()
        ),
      ],
    );
  }

}



class MovimientosTilesDia extends StatelessWidget {
  const MovimientosTilesDia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final codTipoCarga = 0;
    final movimientoService = MovimientoCargoService();
    final gProvider = Provider.of<GlobalProvider>(context, listen: false);


    //TODO: SE HARÁ EL MOSTRADO DE LOS MOVIMIENTOS SEGUN EL TIPO DE CARGA CON UN SWITCH 
    return MovimientosTilesCargo(movimientos: movimientoService.getMovimientosCargo(codTipoCarga.toString(), gProvider.codServicio, '1'));


  }
}

