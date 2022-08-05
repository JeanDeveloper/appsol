import 'package:flutter/material.dart';
import 'package:solgis/theme/theme_people.dart';

class FondoMenuPeople extends StatelessWidget {

  final Widget child;
  final EdgeInsets padding; 

  const FondoMenuPeople({super.key, required this.child, required this.padding});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return Container(

      padding: padding,
      width: size.width,
      alignment: Alignment.center,

      decoration: BoxDecoration(
        color:  AppThemePeople.lighThemePeople.primaryColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0))
      ),

      child: child,

    );

  }
}
