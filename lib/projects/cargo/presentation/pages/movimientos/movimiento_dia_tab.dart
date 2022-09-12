import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/cargo/domain/providers/movimientos_page_provider.dart';
import 'package:solgis/projects/cargo/presentation/pages/movimientos/widgets/widgets.dart';

class MovimientoPlantaTab extends StatelessWidget {

  final int index;
  const MovimientoPlantaTab({
    super.key, 
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    final mProvider = Provider.of<MovimientosPageProvider>(context);
    return Column(

      children:[
        MovimientosHeader( index:index ),
        Expanded( 
          child: Column(
            children: [
              Text('${mProvider.selectedCarga}'),
            ],
          )
        ),
      ],

    );
  }
}

