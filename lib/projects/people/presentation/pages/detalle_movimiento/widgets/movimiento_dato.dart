import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solgis/projects/people/domain/models/movimiento_model.dart';

class MovimientoDataBody extends StatelessWidget {

  final MovimientoModel movimiento;

  const MovimientoDataBody({
    Key? key, 
    required this.movimiento
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(

      width: double.infinity,
      height: size.height*0.55,
      color: Colors.white,

      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            width: size.width* .6,
            height: size.height * .2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(4,4)
                )
              ]
            ),

            child: Column(
              children: [
                Container(
                  width: size.width*0.6,
                  height: size.height*0.04,
                  decoration: const BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12))
                  ),
                  child: const Center(child: Text("Adicional", style: TextStyle(color: Colors.white))),
                ),
                SizedBox(height: size.height*0.03),
                Text((movimiento.tipoPersonal == 'TERCERO')? 'Contratista' : movimiento.tipoPersonal![0] + movimiento.tipoPersonal!.substring(1).toLowerCase()),
                Text((movimiento.sexo == 'M' ? 'Masculino' : 'Femenino')),
                Text(movimiento.tipoIngreso=='INGRESO PEATONAL'? 'Ingreso Peatonal': 'Ingreso Vehicular'),
              ],
            ),

          ),

          SizedBox(height: size.height*0.03),

          if(movimiento.fechaSalida == '')
            Container(
              width: size.width*0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
              child: Column(
                children: [

                  Container(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        const FaIcon(FontAwesomeIcons.personWalkingArrowRight, size: 24, color:Colors.blueGrey),
                        SizedBox(width: size.width* 0.03,),
                        Column(
                          children: [
                            // const Text('3/11/2022'),

                            Text(movimiento.fechaMovimiento.toString().substring(0,10)),

                            SizedBox(height: size.height*0.02),
                            Text(movimiento.fechaMovimiento.toString().substring(11,19)),
                          ],
                        )
                      ],
                    ),
                  ),

                  Container(
                    width: size.width*0.45,
                    height: size.height*0.04,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                    ),
                    child: const Center(child: Text("Entrada", style: TextStyle(color: Colors.white))),
                  )

                ],
              ),
            ),

          if(movimiento.fechaSalida != '')
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  width: size.width*0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [

                      Container(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            const FaIcon(FontAwesomeIcons.personWalkingArrowRight, size: 24, color:Colors.blueGrey),
                            SizedBox(width: size.width* 0.03,),
                            Column(
                              children: [
                                Text(movimiento.fechaMovimiento.toString().substring(0,10)),

                                SizedBox(height: size.height*0.02),
                                Text(movimiento.fechaMovimiento.toString().substring(11,19)),
                              ],
                            )
                          ],
                        ),
                      ),

                      Container(
                        width: size.width*0.45,
                        height: size.height*0.04,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                        ),
                        child: const Center(child: Text("Entrada", style: TextStyle(color: Colors.white))),
                      )

                    ],
                  ),
                ),

                SizedBox(width: size.width*0.05),

                Container(
                  width: size.width*0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [

                      Container(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            const FaIcon(FontAwesomeIcons.personWalkingArrowLoopLeft, size: 24, color:Colors.blueGrey),
                            SizedBox(width: size.width* 0.03,),
                            Column(
                              children: [
                                Text(movimiento.fechaSalida.toString().substring(0,10)),

                                SizedBox(height: size.height*0.02),
                                Text(movimiento.fechaSalida.toString().substring(11,19)),
                              ],
                            )
                          ],
                        ),
                      ),

                      Container(
                        width: size.width*0.45,
                        height: size.height*0.04,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                        ),
                        child: const Center(child: Text("Salida", style: TextStyle(color: Colors.white))),
                      )

                    ],
                  ),
                ),

              ],
            ),

        ],
      ),

    );

  }
}