import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/cargo/domain/providers/movimientos_page_provider.dart';
import 'package:solgis/projects/cargo/presentation/pages/movimientos/widgets/movimientos_header.dart';
import 'package:solgis/projects/cargo/presentation/widgets/movimientos_tiles_cargo.dart';

class MovimientoDiaTab extends StatelessWidget {
  const MovimientoDiaTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: const [

        //FILTRO DEL TIPO DE CARGA
        MovimientosHeader(),

        Expanded(child: MovimientosTileDia()),

      ],

    );
  }

}

class MovimientosTileDia extends StatelessWidget {
  const MovimientosTileDia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const codTipoCarga = 0;
    final gProvider = Provider.of<GlobalProvider>(context, listen:false);
    final movimientosProvider = Provider.of<MovimientosCargoPageProvider>(context, listen: false);

    return MovimientosTilesCargo(movimientos:movimientosProvider.getMovimientosCargo(codTipoCarga.toString(), gProvider.codServicio, '2'));

  }
}