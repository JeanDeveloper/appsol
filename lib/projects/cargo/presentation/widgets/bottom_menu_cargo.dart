import 'package:flutter/material.dart';
import 'package:solgis/projects/cargo/theme/theme_cargo.dart';

class BottomMenuCargo extends StatelessWidget {

  final Widget child;
  final EdgeInsets padding; 

  const BottomMenuCargo({super.key, required this.child, required this.padding});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return Container(

      padding: padding,
      width: size.width,
      alignment: Alignment.center,

      decoration: BoxDecoration(
        color:  AppThemeCargo.lighThemeCargo.primaryColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0))
      ),

      child: child,

    );

  }
}
