import 'package:flutter/material.dart';

class IngresoCargoPage extends StatelessWidget {

  String titleIngreso;
  Color colorAppBar;
  Widget body ;
  Function()? registrarFunction;

  IngresoCargoPage({
    required this.titleIngreso,
    required this.colorAppBar,
    required this.body,
    required this.registrarFunction
  });



  @override
  Widget build(BuildContext context) {

    final viewBotton  = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorAppBar,
        
        title: Text(
          titleIngreso,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),

      ),

      body: body,

    );
  }
}