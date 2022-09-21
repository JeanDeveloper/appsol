import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/cargo/domain/providers/movimientos_page_provider.dart';
import 'package:solgis/projects/cargo/presentation/pages/movimientos/widgets/widgets.dart';
import 'package:solgis/projects/cargo/presentation/widgets/widgets.dart';

class MovimientoPlantaTab extends StatelessWidget {

  const MovimientoPlantaTab({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {

    // final mProvider = Provider.of<MovimientosPageProvider>(context);

    return Column(

      children: const [
        //FILTRO POR TIPO DE CARGA.
        MovimientosHeader(),

        Expanded(child: MovimientosTilesPlanta()),

      ],

    );

  }

}

class MovimientosTilesPlanta extends StatelessWidget {
  const MovimientosTilesPlanta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const codTipoCarga = 0;
    // final movimientoService = MovimientoCargoProvider();

    final gProvider = Provider.of<GlobalProvider>(context, listen: false);
    final movimientosProvider = Provider.of<MovimientosCargoPageProvider>(context, listen: false) ;

    //TODO: SE HARÁ EL MOSTRADO DE LOS MOVIMIENTOS SEGUN EL TIPO DE CARGA CON UN SWITCH 
    return MovimientosTilesCargo(
      movimientos:  movimientosProvider.getMovimientosCargo(
        codTipoCarga.toString(), 
        gProvider.codServicio, 
        '1'
      ),


    );

  }
}

