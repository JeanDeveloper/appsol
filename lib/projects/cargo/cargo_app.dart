import 'package:flutter/material.dart';

class CargoApp extends StatelessWidget{
  
  const CargoApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      title: 'Cargo',
      debugShowCheckedModeBanner: false,
      // routes: PeopleRoutes.routes,
    );
  }

}