import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/cargo/domain/providers/movimientos_page_provider.dart';
import 'package:solgis/projects/cargo/styles/style.dart';

class MovimientosHeader extends StatelessWidget {

  const MovimientosHeader({
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    initializeDateFormatting('es');
    final size = MediaQuery.of(context).size;
    final gProvider = Provider.of<GlobalProvider>(context);
    final movimientosProvider = Provider.of<MovimientosCargoPageProvider>(context);


    return Container(
      padding: const EdgeInsets.symmetric(vertical:30),
      width: double.infinity,
      height: size.height*0.25,

      child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [

          //FECHA 
          AutoSizeText(DateFormat('EEEE, d MMMM yyyy', 'es').format(DateTime.now()), style: textStyleDate(), minFontSize: 6),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText('CANTIDAD:', style: TextStyle( color: Colors.green, fontSize: size.height*0.03, fontWeight: FontWeight.bold), minFontSize: 6),
              SizedBox( width: size.width*0.03),
              AutoSizeText(movimientosProvider.movimientosContador.toString(), style: TextStyle(fontSize: size.height*0.03, fontWeight:  FontWeight.bold, color:  Colors.black), minFontSize: 6,),
            ],
          ),

          // FutureBuilder(

          //   future: TiposCargaService.getTiposCarga(gProvider.codCliente),

          //   builder: ( _ ,  AsyncSnapshot<List<TipoCargaModel>> snapshot) {

          //     if(!snapshot.hasData){
          //       return ShimmerWidget(
          //         width: size.width * 0.57,
          //         height: size.height * 0.04,
          //       );
          //     }

          //     final tiposCarga = snapshot.data!;

          //     return DropdownButton<int>(
          //       hint: const Text('Seleccione un tipo de carga'),
          //       onChanged: (value) => movimientosProvider.selectedCarga = value!,
          //       value: (movimientosProvider.selectedCarga == -1) ? null : movimientosProvider.selectedCarga,
          //       items: tiposCarga.map<DropdownMenuItem<int>>((TipoCargaModel carga){
          //         return DropdownMenuItem<int>(
          //           value: int.parse(carga.codigoCarga!),
          //           child: Text(carga.carga!),
          //         );
          //       }).toList(), 
          //     );

          //   },
          // ),

        ],
      ),
    );
  }
}