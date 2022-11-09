import 'package:flutter/material.dart';
import 'package:solgis/projects/people/domain/models/datos_acceso_salida_model.dart';
import 'package:solgis/projects/people/domain/models/movimiento_model.dart';
import 'package:solgis/projects/people/presentation/pages/detalle_movimiento/widgets/widgets.dart';

class MovimientoDatoAccesoBody extends StatelessWidget {
  final MovimientoModel movimiento;
  final DatosAccesoSalidaModel datosSalida;

  const MovimientoDatoAccesoBody({
    Key? key, 
    required this.movimiento,
    required this.datosSalida,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(movimiento.fechaSalida == ''){
      return OnlyEntryDataWidget(movimiento: movimiento);
    }else{
      return EntryandExitDataWidget(movimiento: movimiento, datosSalida: datosSalida );
    }
  }
}

class EntryandExitDataWidget extends StatelessWidget{

  final MovimientoModel movimiento;
  final DatosAccesoSalidaModel datosSalida;

  const EntryandExitDataWidget({
    Key? key, 
    required this.movimiento,
    required this.datosSalida,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(

      width: double.infinity,
      height: size.height * .55,

      child: PageView(

        children: [

          //ENTRADA
          if(movimiento.codDatoAcceso != 0)
            CardAccesoWidget(
              title: 'Entrada',
              guiaMov: movimiento.guiaMov!, 
              urlGuiaMov: movimiento.fotoGuiaMov!, 
              materialMov: movimiento.materialMov!, 
              urlMaterialMov: movimiento.fotoMaterialMov!
            ),

          //SALIDA
          if(datosSalida.codigoDatosAcceso != '0')
            CardAccesoWidget(
              title: 'Salida',
              guiaMov: datosSalida.guiaMovimiento!, 
              urlGuiaMov: datosSalida.urlGuiaMovimiento!, 
              materialMov: datosSalida.materialMovimiento!, 
              urlMaterialMov: datosSalida.urlMaterialMovimiento!
            )

        ],
      ),
    );

    // return FutureBuilder(
    //   future: datoAcceso.getDatosAccesoSalida(gProvider.codServicio, movimiento.dni! ),
    //   builder: (context, AsyncSnapshot<DatosAccesoSalidaModel?>snapshot) {

    //     if(!snapshot.hasData) return SizedBox( width: double.infinity, height: size.height * .55, child: const Center(child: CircularProgressIndicator(),));

    //     DatosAccesoSalidaModel salidaDatos = snapshot.data!;

    //     return SizedBox(

    //       width: double.infinity,
    //       height: size.height * .55,

    //       child: PageView(

    //         children: [

    //           //ENTRADA
    //           if(movimiento.codDatoAcceso != 0)
    //             CardAccesoWidget(
    //               title: 'Entrada',
    //               guiaMov: movimiento.guiaMov!, 
    //               urlGuiaMov: movimiento.fotoGuiaMov!, 
    //               materialMov: movimiento.materialMov!, 
    //               urlMaterialMov: movimiento.fotoMaterialMov!
    //             ),

    //           //SALIDA
    //           if(salidaDatos.codigoDatosAcceso != '0')
    //             CardAccesoWidget(
    //               title: 'Salida',
    //               guiaMov: salidaDatos.guiaMovimiento!, 
    //               urlGuiaMov: salidaDatos.urlGuiaMovimiento!, 
    //               materialMov: salidaDatos.materialMovimiento!, 
    //               urlMaterialMov: salidaDatos.urlMaterialMovimiento!
    //             )
    //         ],
    //       ),
    //     );
    //   },
    // );

  }

}

class OnlyEntryDataWidget extends StatelessWidget{

  final MovimientoModel movimiento;

  const OnlyEntryDataWidget({
    Key? key, 
    required this.movimiento
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: size.height*.09),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          if(movimiento.guiaMov != '')
            CardAcceso(
              tipoDatoAcceso: 'Guia', 
              pathUrl: movimiento.fotoGuiaMov,
              textDato: movimiento.guiaMov,
            ),

          if(movimiento.materialMov != '')
            SizedBox(width: size.width*0.1),

          if(movimiento.materialMov != '')
            CardAcceso(
              tipoDatoAcceso: 'Material', 
              pathUrl: movimiento.fotoMaterialMov,
              textDato: movimiento.materialMov,
            ),

        ],

      ),
    );

  }

}