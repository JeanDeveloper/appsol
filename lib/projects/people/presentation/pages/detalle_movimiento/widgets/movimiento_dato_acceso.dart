import 'package:flutter/material.dart';
import 'package:solgis/projects/people/domain/models/datos_acceso_movimiento_model.dart';
import 'package:solgis/projects/people/domain/models/movimiento_model.dart';
import 'package:solgis/projects/people/presentation/pages/detalle_movimiento/widgets/card_acceso.dart';
import 'package:solgis/projects/people/presentation/pages/detalle_movimiento/widgets/widgets.dart';

class MovimientoDatoAccesoBody extends StatelessWidget {

  final MovimientoModel movimiento;
  final List<DatoAccesoMModel>? datosSalida;

  const MovimientoDatoAccesoBody({
    Key? key, 
    required this.movimiento,
    required this.datosSalida,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(movimiento.fechaSalida == ''){
      return OnlyEntryDataWidget(movimiento: movimiento, datosSalida: datosSalida);
    }else{
      return EntryandExitDataWidget(movimiento: movimiento, datosSalida: datosSalida );
    }
  }

}

class EntryandExitDataWidget extends StatelessWidget{

  final MovimientoModel movimiento;
  final List<DatoAccesoMModel>? datosSalida;

  const EntryandExitDataWidget({
    Key? key, 
    required this.movimiento,
    required this.datosSalida,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(datosSalida == null) return Container();

    final size = MediaQuery.of(context).size;

    return SizedBox(
      
      width: double.infinity,
      height: size.height * .55,

      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical:size.height * .05),
        itemCount: datosSalida!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ( _ , i ) {

          return CardAcceso(
            tipoDatoAcceso: (datosSalida![i].codTipoDatoAcceso == 1)? 'Guia' : 'Material',
            pathUrl: datosSalida![i].pathImage,
            textDato: datosSalida![i].descripcion ,
          );

        },
      ),

    );

  }

}

class OnlyEntryDataWidget extends StatelessWidget{

  final List<DatoAccesoMModel>? datosSalida;

  final MovimientoModel movimiento;

  const OnlyEntryDataWidget({
    Key? key, 
    required this.movimiento, 
    this.datosSalida
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if(datosSalida == null) return Container();

    return Padding(
      padding: EdgeInsets.only(top: size.height*.09),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,

        children: datosSalida!.map((dato) {

          return CardAcceso(
            tipoDatoAcceso: (dato.codTipoDatoAcceso== 1) ? 'Guia' : 'Material', 
            pathUrl: dato.pathImage, 
            textDato: dato.descripcion
          );

        }).toList(),

      ),
    );

  }

}