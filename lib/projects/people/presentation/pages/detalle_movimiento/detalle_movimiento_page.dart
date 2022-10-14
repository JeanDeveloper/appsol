import 'package:flutter/material.dart';
import 'package:solgis/projects/people/domain/models/movimiento_model.dart';

class DetailMovimientoPage extends StatelessWidget {

  MovimientoModel movimiento;

  DetailMovimientoPage({
    required this.movimiento,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle Movimiento'),
      ),
      body: Text('${movimiento.nombres}'),

    );

  }

}